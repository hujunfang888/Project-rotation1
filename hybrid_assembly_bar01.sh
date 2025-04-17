!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=05:00:00
#SBATCH --job-name=hybrid_pass_bar5
#SBATCH --output=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group1/bash_scripts/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda environment
conda activate unicycler
cd /share/BioinfMSc/rotation1/Group1/

unicycler -1 /share/BioinfMSc/rotation1/Group1/Illumina/merged_forward.fastq.gz $

# deactivate conda environment
conda deactivate


