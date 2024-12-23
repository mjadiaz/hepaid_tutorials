from blssm_obj_fns import  hep_objective_fn, obj_hep_config
from hepaid.search.objective import Objective
from hepaid.search.method import bCASTOR
from hepaid.search.method import MLScan
from hepaid.search.method.eci import smooth_box_mask
import torch

if torch.cuda.is_available():
    print("GPU is available!")
    print("GPU Name:", torch.cuda.get_device_name(0))  # Get the name of the first GPU
else:
    print("GPU is not available.")

# Define likelihood for MCMC and MLScan
def likelihood(x):
    if not isinstance(x, torch.Tensor):
        x = torch.tensor(x)
    mh1 = x[:,0]
    mh2 = x[:,1]

    h1 = smooth_box_mask(mh1, 90.4, 100.4, 1e-3 )
    h2 = smooth_box_mask(mh2, 120.4, 130.4, 1e-3 )
    return  h1*h2


test_objective = Objective(
        function_config = obj_hep_config,
        function = hep_objective_fn,
)

hp = 'configs/bcastor.yml'

method= bCASTOR(
    objective=test_objective,
    hyper_parameters=hp
    )


###  Uncomment for MLScan or MCMC
#test_objective = Objective(
#        function_config = obj_hep_config,
#        function = objective_fn,
#        cas=False
#)
#hp = 'configs/mlscan.yml'
#method= MLScan(
#     objective=test_objective,
#     likelihood=likelihood,
#     hyper_parameters=hp
#     )

method.run()
