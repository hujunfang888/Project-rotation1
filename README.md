#  Group 1 – Barcode01 & Barcode05 Genome Project

This repository contains all scripts, results, and documentation for the analysis of barcode01 and barcode05 using Illumina-only, long-read (ONT), and hybrid assembly methods.

We performed genome assembly, annotation, structure comparison, and method evaluation for each sample.

---

## Introduction

This project aimed to:

- Assemble and annotate microbial genomes from barcode01 and barcode05
- Compare Illumina-only, long-read, and hybrid strategies
- Evaluate annotation quality using gene counts and contig statistics
- Visualize graph structures (via Bandage)

We compared different assembly methods and recorded our results for each barcode.  
Everything here is reproducible and organized by sample and method.

---

## Installation

All tools were installed using `conda`.

```bash
# Unicycler (assembly)
conda create -n unicycler_env -c bioconda unicycler=0.5.1
conda activate unicycler_env

# Prokka (annotation)
conda create -n prokka_env -c bioconda prokka=1.14.6
conda activate prokka_env

# Bandage (visualization)
conda install -c bioconda bandage

---

## Data

### Input files

| File | Description |
|------|-------------|
| `bar5merged_forward.fastq.gz` | Illumina forward reads (barcode05) |
| `bar5merged_reverse.fastq.gz` | Illumina reverse reads (barcode05) |
| `bar5_pass_merged.fastq.gz` | Long reads (ONT, barcode05) |
| `Merged_pass.fastq.gz` | Long reads (ONT, barcode01) |
| `001_spades_graph_k069.gfa` | Illumina assembly graph (bar05) |
| `assembly_bar05.fasta` | Contigs extracted from `.gfa` (bar05 Illumina) |
| `Long_read_assemble/output_dir/assembly.fasta` | Long-read assembly (bar01) |
| `pass_hybrid/assembly.fasta` | Hybrid assembly (bar01) |

###  Output files

| File | Description |
|------|-------------|
| `annotated_bar05.gff` | Annotation (bar05 Illumina) |
| `annotated_bar05.txt` | Summary stats (bar05) |
| `PROKKA_02062025.gff` | Annotation (bar01 long reads) |
| `PROKKA_02062025.txt` | Summary stats (bar01 long) |
| `PROKKA_02132025.gff` | Annotation (bar01 hybrid) |
| `PROKKA_02132025.txt` | Summary stats (bar01 hybrid) |
| `*.png` | Bandage graph screenshots |
