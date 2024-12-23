import numpy as np

from hepaid.search.objective import Objective
from hepaid.hep.stack import hep_stack_fn
from hepaid.hep.utils import create_simple_dict


hep_stack_cfg = 'configs/hep_stack_config_open.yml'
obj_hep_config = 'configs/three_masses_spheno_config.yml'
# obj_hep_config = 'configs/masses_spheno_config.yml'


def blssm_higgs_masses_fn(hep_stack_cfg, obj_hep_cfg):
    def output_obj_fn(x):
        result = hep_stack_fn(
            x,
            hep_config=hep_stack_cfg,
        )
        # Commented to save all hepstack data
        result = create_simple_dict(obj_hep_config, result)
        return result
    return output_obj_fn


hep_objective_fn = blssm_higgs_masses_fn(
    hep_stack_cfg=hep_stack_cfg,
    obj_hep_cfg=obj_hep_config,
)
hep_objective = Objective(
    function=hep_objective_fn,
    function_config=obj_hep_config
)

if __name__ == '__main__':
    # Test

    obj = Objective(
        function=hep_objective_fn,
        function_config=obj_hep_config
    )
    print(obj)
    x = np.array(obj.space.rvs())
    x = np.array([810.3113227782766, 2329.780075121109,  17.69281474940521,  3421.070390622817,
                 7313.578069863165, 6990.57913776928, 28734324.300159443, 4356075.451915027])
    result = obj.sample(x, is_normalised=False)
    print(result)

    breakpoint()
