#  Group 1 – Barcode01 & Barcode05 Genome Project

This repo includes everything we did to assemble and annotate the genomes from barcode01 and barcode05.  
We used Illumina, long-read, and hybrid sequencing data. All our scripts, results, and notes are included here.

---

## Introduction

In this project, we:

- Assembled genomes for barcode01 and barcode05 using Illumina, long-read, and hybrid data
- Annotated the assemblies using Prokka
- Used Bandage to look at the genome structure

We compared different assembly methods and recorded our results for each barcode.  
Everything here is reproducible and organized by sample and method.

---

## Installation

We used `conda` to install all the tools.  
Below are the commands we used to set up the environments.

```bash
# Prokka for genome annotation
conda create -n prokka_env -c bioconda prokka=1.14.6
conda activate prokka_env

# Unicycler for assembly (uses SPAdes underneath)
conda create -n unicycler_env -c bioconda unicycler=0.5.1
conda activate unicycler_env


# Bandage for GFA graph visualization
conda install -c bioconda bandage


---

## Data

### Input files

| File | Description |
|------|-------------|
| `bar5merged_forward.fastq.gz` | Illumina forward reads (barcode05) |
| `bar5merged_reverse.fastq.gz` | Illumina reverse reads (barcode05) |
| `bar5_pass_merged.fastq.gz` | long reads (barcode05) |
| `001_spades_graph_k069.gfa` | Assembly graph (SPAdes, k=69, Illumina-only) |
| `assembly_bar05.fasta` | Final contigs (from `.gfa`, used for annotation) |


### Output files

| File | Description |
|------|-------------|
| `assembly_bar05.fasta` | Extracted contigs used for annotation |
| `annotated_bar05.gff` | Prokka annotation result |
| `annotated_bar05.txt` | Summary of gene features |
| `*.png` | Bandage graph screenshots (for structure visualization) |
