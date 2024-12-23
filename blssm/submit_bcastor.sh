#!/bin/bash
##SBATCH --partition=ecsstaff
#SBATCH --account=ecsstaff
#SBATCH --job-name=bcastor
#SBATCH --time=24:00:00
#SBATCH --nodes=1
##SBATCH --gres=gpu:1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=30
#SBATCH --output=slurm-%j.out    # Standard output log
#SBATCH --error=slurm-%j.err     # Standard error log

module load gcc/12.1.0 || { echo "Failed to load gcc module"; exit 1; }
module load cmake || { echo "Failed to load cmake module"; exit 1; }
eval "$(micromamba shell hook -s bash)"
micromamba activate hepaidtest1 || { echo "Failed to activate conda environment"; exit 1; }


# Run the Python script with the provided arguments
python bcastor_run.py || { echo "Python script failed"; exit 1; }
#python generate_slha_dataset.py || { echo "Python script failed"; exit 1; }
