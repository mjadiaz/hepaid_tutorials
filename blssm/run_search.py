
from omegaconf import OmegaConf

import itertools
import click

from pathlib import Path
from hepaid.search.method import bCASTOR, MCMCMH
from hepaid.search.objective import Objective

from blssm_obj_fns import aa_pheno_obj_fn
from blssm_obj_fns import aa_bb_pheno_obj_fn
from blssm_obj_fns import all_pheno_obj_fn


hep_stack_cfg = 'configs/hep_stack_config.yaml'

def sweep(config, n, mode='sweep'):
    """
    General sweep function handling both constant resolution and decay sweeps.
    
    Args:
        config: The configuration object to modify.
        n: The combination index to select from the parameter sweep space.
        mode: Sweep mode, either 'sweep' for constant resolution or 'sweep_decay' for decaying resolution.
    
    Returns:
        Updated configuration object.
    """
    if mode == 'sweep':
        tpe_trials = [100, 300, 500]
        alpha = [1, 2]
        r = [0.2, 0.02, 0.002]
        combinations = list(itertools.product(tpe_trials, alpha, r))
        
        if n >= len(combinations):
            raise ValueError(f"Invalid combination index {n}. Max is {len(combinations) - 1}.")

        config.batch_sampling.tpe_trials = combinations[n][0]
        config.batch_sampling.alpha = combinations[n][1]
        config.resolution.constant_resolution = True
        config.resolution.value = combinations[n][2]

        config.run_name = f'hb_bcastor_local/run_{n}'

    elif mode == 'sweep_decay':
        tpe_trials = [500, 1000, 1500, 2000, 2500]
        r = [(0.02, 0.002), (0.002, 0.0002), (0.0002, 0.00002), (0.02, 0.000002)]
        combinations = list(itertools.product(tpe_trials, r))

        if n >= len(combinations):
            raise ValueError(f"Invalid combination index {n}. Max is {len(combinations) - 1}.")

        config.batch_sampling.tpe_trials = combinations[n][0]
        config.resolution.constant_resolution = False
        config.resolution.initial = combinations[n][1][0]
        config.resolution.final = combinations[n][1][1]

        config.run_name = f'blssm_sweep/run_{n}'

    else:
        raise ValueError(f"Unknown sweep mode: {mode}")

    return config

@click.command()
@click.option('--method', type=str, default='bcastor', help='Search method: bcastor/mcmc')
@click.option('--n', type=int, default=0, help='Combination number')
@click.option('--mode', type=str, default='single_run', help='single_run/sweep_decay')
@click.option('--config', type=str, default='configs/bcastor_aa_hypr_prms.yml', help='Path to the config file')
@click.option('--channels', type=str, default='aa', help='Fitting aa/aabb/all')
@click.option('--name', type=str, default='', help='New name to edit the config')
def run(method, n, mode, config, channels,name):
    search_hyper_parameters = OmegaConf.load(config)
    if method == 'bcastor':
        if mode in ['sweep', 'sweep_decay']:
            search_hyper_parameters = sweep(search_hyper_parameters, n, mode)
    if name != '':
        search_hyper_parameters.run_name = search_hyper_parameters.run_name + name
    

    # Set the objective based on the selected channel
    if channels == 'aa':
        obj_hep_config= 'configs/aa_obj_hep.yml'
        objective_fn = aa_pheno_obj_fn(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_stack_cfg,
            )
    elif channels == 'aabb':
        eehzzbb = 'configs/mg5/blssm_eehzzbb_LEP.txt'
        hep_stack_cfg.madgraph.scripts['eehzzbb'] = eehzzbb
        obj_hep_config = 'configs/aa_bb_obj_hep.yml'
        objective_fn = aa_bb_pheno_obj_fn(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_stack_cfg,
            )
    elif channels == 'all':
        eehzzbb = 'configs/mg5/blssm_eehzzbb_LEP.txt'
        gghtautau = 'configs/mg5/blssm_pphtautau_LHC13.txt'
        hep_stack_cfg.madgraph.scripts['eehzzbb'] = eehzzbb
        hep_stack_cfg.madgraph.scripts['gghtautau'] = gghtautau 
        obj_hep_config = 'configs/aa_bb_tautau_obj_hep.yml'
        objective_fn = all_pheno_obj_fn(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_stack_cfg,
            )
    else:
        raise ValueError(f"Unknown channel type: {channels}")

    # Initialize objective and method
    if method == 'bcastor':
        objective = Objective(
            function_config=obj_hep_config,
            function=objective_fn,   
        )
        search_method= bCASTOR(
            objective_function=objective,
            hyper_parameters=search_hyper_parameters
        )
    elif method == 'mcmc':
        objective = Objective(
            function_config=obj_hep_config,
            function=objective_fn,   
            cas=False
        )
        search_method = MCMCMH(
            objective_function=objective,
            hyper_parameters=search_hyper_parameters
        )
    else:
        raise ValueError("Unknown method type: {method} Please select --method bcastor/mcmc")


    

    # Save the configuration to the specified run path
    config_path = Path('datasets') / search_hyper_parameters.run_name
    config_path.mkdir(parents=True, exist_ok=True)  # Ensure directories are created
    OmegaConf.save(config=search_hyper_parameters, f=config_path / 'hprms.yaml')

    search_method.run()
if __name__ == "__main__":
    run()
