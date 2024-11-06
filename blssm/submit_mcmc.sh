#!/bin/bash 
#SBATCH --job-name=mcmc
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --output=slurm-%j.out    # Standard output log
#SBATCH --error=slurm-%j.err     # Standard error log

module load gcc/12.1.0 || { echo "Failed to load gcc module"; exit 1; }
module load cmake || { echo "Failed to load cmake module"; exit 1; }
eval "$(micromamba shell hook -s bash)"
micromamba activate wasp || { echo "Failed to activate conda environment"; exit 1; }

# Check if the required arguments are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
    echo "Usage: $0 <method> <config> <channels> <name>"
    exit 1
fi

# Assign the provided arguments to variables
method="$1"
config="$2"
channels="$3"
name="$4"
# Print the values of the variables
echo "config is set to: $config"
echo "channels is set to: $channels"
echo "method is set to: $method"
echo "name is set to: $name"

# Run the Python script with the provided arguments
python run_search.py --method "$method" --config "$config" --channels "$channels" --name "$name" || { echo "Python script failed"; exit 1; }
