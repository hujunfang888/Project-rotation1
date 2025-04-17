#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=08:00:00
#SBATCH --job-name=bar05_reunicycler
#SBATCH --output=/share/BioinfMSc/rotation1/Group1/Illumina/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group1/Illumina/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alyjh38@nottingham.ac.uk

source $HOME/.bash_profile

conda activate unicycler_env

unicycler -1 bar5merged_forward.fastq.gz \
          -2 bar5merged_reverse.fastq.gz \
          -o /share/BioinfMSc/rotation1/Group1/Illumina/bar5output_rerun \
          --mode normal \
          --threads 8

conda deactivate
