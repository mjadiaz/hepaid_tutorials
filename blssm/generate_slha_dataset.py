'''
Read the dataset from a search method and
generate the full SLHA dataset from complete
model information.
'''
from blssm_obj_fns import  hep_objective_fn, obj_hep_config
from blssm_obj_fns import hep_stack_cfg
from hepaid.search.objective import Objective
from hepaid.search.method import bCASTOR
from hepaid.search.method import MLScan
from hepaid.search.method.eci import smooth_box_mask
from hepaid.hep.stack import hep_stack_fn

from hepaid.hep.data import HEPDataSet
from hepaid.search.parallel.modules import run_x_with_pool

import torch

# Init and load the objective
test_objective = Objective(
        function_config = obj_hep_config,
        function = hep_objective_fn,
)
test_objective.load('datasets/blssm/run_1/checkpoint')

# Init the hepsatck
hepdata = HEPDataSet()
# Take the satisfactory samples
df = test_objective.as_dataframe()
df= df[df.satisfactory == True]
X = df.iloc[:,:8].values

result = run_x_with_pool(X, 30, hep_objective_fn)

for datapoint in result:
    print(datapoint)
    hepdata.add(datapoint)
hepdata.save_json('datasets/hepdata/run_1')
