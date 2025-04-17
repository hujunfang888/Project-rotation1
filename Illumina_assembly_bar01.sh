#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --job-name=my_job
#SBATCH --output=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alyjh38@nottingham.ac.uk

source $HOME/.bash_profile

conda activate ro1_nanoplot

unicycler -1 merged_forward.fastq.gz -2 merged_reverse.fastq.gz -o output_dir

conda deactivate

