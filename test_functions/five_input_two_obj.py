import torch
from hepaid.search.objective.plot import CornerPlot
from hepaid.search.method.eci import smooth_box_mask, smooth_mask
import numpy as np
from omegaconf import OmegaConf
from hepaid.search.objective import Objective

from hepaid.search.method import MLScan

def multi_objective_function(x):
    # Objective 1: Minimise distance to origin
    f1 = np.sum(np.square(x - 1))
    # Objective 2: Minimise distance to the point [2, 2, 2, 2, 2]
    f2 = np.sum(np.square(x - 2))
    x1, x2, x3, x4, x5 = x
    return {'x1': x1, 'x2': x2, 'x3': x3, 'x4': x4, 'x5': x5, 'f1': f1, 'f2': f2}

# Define the function configuration for OmegaConf
function_config = OmegaConf.create({
    'input_space': {
        'x1': {'lower': -5, 'upper': 5, 'distribution': 'uniform'},
        'x2': {'lower': -5, 'upper': 5, 'distribution': 'uniform'},
        'x3': {'lower': -5, 'upper': 5, 'distribution': 'uniform'},
        'x4': {'lower': -5, 'upper': 5, 'distribution': 'uniform'},
        'x5': {'lower': -5, 'upper': 5, 'distribution': 'uniform'}
    },
    'output_parameters': ['f1', 'f2'],
    'objectives': {
        'double_constraint': {'f2': [['gt', 2], ['lt', 4]]},  # Constrains f2 to be within (2, 4)
        'single_constraint': {'f1': ['lt', 3.0]}              # Constrains f1 to be less than 3.0
    }
})

test_objective = Objective(
    function_config=function_config,
    function=multi_objective_function,
    cas=False
)

def likelihood(x):
    if not isinstance(x, torch.Tensor):
        x = torch.tensor(x)
    mh1 = x[:,0]
    mh2 = x[:,1]

    h1 = smooth_box_mask(mh1, 2., 4, 1e-3 )
    h2 = 1 - smooth_mask(mh2, 3 , 1e-3)
    return  h1*h2


if __name__ == '__main__':
    # Test the function
    # x = test_objective.space.rvs()
    # x = test_objective.space.transform(x)
    # print(x)
    # result = test_objective.sample(x)
    # print(result)
    #
    #

    # Run MLScan
    # method = MLScan(test_objective, likelihood, hyper_parameters='mlscan.yml')
    # method.run()



    # Load test objective
    test_objective.load('datasets/mlscan/run_1/chckpnt')
    print(test_objective)

    # Define 'good' for satisfactory points, 'bad' for the rest
    good = test_objective.satisfactory.prod(axis=1).astype(bool)
    bad = ~good

    # Export dataset as a DataFrame
    df = test_objective.as_dataframe()

    # Initialise CornerPlot for visualisation
    cp = CornerPlot(
        figsize=(6, 6),
        parameters=test_objective.input_parameters
    )

    # Add traces for satisfactory and unsatisfactory points
    cp.add_trace(df[bad], r'$\notin \mathcal{S}$', alpha=1)
    cp.add_trace(df[good], r'$\in \mathcal{S}$', alpha=1)


    # Update legend and clean up figure
    cp.update_legend()
    cp.clean()

    # Save figure as a PDF with high resolution

    cp.fig.savefig('test_search_corner.png', dpi=300)
    cp.fig.show()
