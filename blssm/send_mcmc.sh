#!/bin/bash

channel=$1   # First argument (channel)
n_workers=$2 # Second argument (number of workers)

for ((i=1; i<=n_workers; i++))
do
    sbatch submit_mcmc.sh mcmc configs/mcmc.yml "$channel" "$channel"_"$i"
done