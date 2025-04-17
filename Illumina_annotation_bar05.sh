#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=10:00:00
#SBATCH --job-name=my_job
#SBATCH --output=//share/BioinfMSc/rotation1/Group1/Illumina/bar5output_rerun/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group1/Illumina/bar5output_rerun/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alyjh38@nottingham.ac.uk

source $HOME/.bash_profile

conda  activate prokka

prokka --outdir /share/BioinfMSc/rotation1/Group1/Illumina/bar5output_rerun/prokka_bar05_v3 \
       --prefix annotated_bar05 \
       /share/BioinfMSc/rotation1/Group1/Illumina/bar5output_rerun/assembly_bar05.fasta


conda deactivate
