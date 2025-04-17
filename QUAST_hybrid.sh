#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=02:00:00
#SBATCH --job-name=QUAST
#SBATCH --output=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

cd /share/BioinfMSc/rotation1/Group1/Illumina/pass_hybrid

source $HOME/.bash_profile

conda activate quast

quast.py assembly.fasta -r seqdump-2.txt -o QUAST

conda deactivate
