#  Group 1 – Barcode01 & Barcode05 Genome Project

This repository contains all scripts, results, and documentation for the analysis of barcode01 and barcode05 using Illumina-only, long-read (ONT), and hybrid assembly methods.

We performed genome assembly, annotation, structure comparison, and method evaluation for each sample.


## Navigation

-  [Assembly Results & Bandage Graphs](./results.md)
-  [IGV Mapping Visualisation](./igv_visualisation/igv_visualisation.md)


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

The following tools were used throughout this project. All packages were installed via `conda` using the [bioconda](https://bioconda.github.io/) channel. Version numbers are specified for reproducibility.

```bash
conda create -n bioinfo_env python=3.9
conda activate bioinfo_env

# Quality control
conda install -c bioconda fastqc=0.11.9

# Genome assembly and annotation
conda install -c bioconda unicycler=0.5.0
conda install -c bioconda prokka=1.14.6
conda install -c bioconda quast=5.0.2

# Alignment and evaluation
conda install -c bioconda bwa=0.7.17
conda install -c bioconda minimap2=2.24
conda install -c bioconda samtools=1.15

# Visualisation
conda install -c bioconda bandage=0.8.1

```
All analyses were run in a Linux environment using SLURM. Environment variables were loaded via .bash_profile.

---

## Data Overview

In this project, we worked with two bacterial samples (barcode01 and barcode05), using both Illumina short reads and Nanopore long reads. We also performed hybrid assemblies by combining the two datasets. For the alignment steps, Illumina and Nanopore reads were mapped separately to allow clearer comparison of read coverage and mapping quality.

| Data Type       | Format                    | Description                                                                 |
|------------------|----------------------------|------------------------------------------------------------------------------|
| Raw reads        | `.fastq.gz` (Illumina), `.fastq` (Nanopore) | Paired-end Illumina reads and Nanopore long reads for both barcode01 and barcode05 |
| Assembly graphs  | `.gfa`                    | Graphs from Unicycler/SPAdes used for Bandage visualisation                 |
| Genome assemblies| `.fasta`                  | Final assembled contigs for each strategy (Illumina, long-read, hybrid)     |
| Annotations      | `.gff`, `.txt`            | Gene annotation outputs from Prokka (CDS, rRNA, tRNA, summary)              |
| Alignments       | `.bam`, `.bai`            | Alignments of raw reads to assemblies using BWA (short-read) and minimap2 (long-read) |
| Visualisations   | `.png`                    | Screenshots from Bandage and IGV, stored in `figures/` and `igv_visualisation/` |


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
| `*.png` | Bandage graph screenshots 

---

## Quality Control & Assembly Evaluation

**FastQC Reports:**

- [Forward reads (barcode01)](https://hujunfang888.github.io/Project-rotation1/merged_forward_fastqc.html)
- [Reverse reads (barcode01)](https://hujunfang888.github.io/Project-rotation1/merged_reverse_fastqc.html)
- [MultiQC summary](https://hujunfang888.github.io/Project-rotation1/fastqc_report.html)


**QUAST Assembly Reports:**

- [Long-read assembly (barcode01)](https://hujunfang888.github.io/Project-rotation1/QUAST_longreads.html)
- [Hybrid assembly (barcode01)](https://hujunfang888.github.io/Project-rotation1/QUAST_hybrid.html)

---

# IGV Visualisation of barcode01 and barcode05

[IGV visualisation summary (barcode01 & barcode05)](./igv_visualisation/igv_visualisation.md)



---

##  Illumina comparison (short reads)

**Reference contig:** `NODE_1_length_298171`  
**Region visualised:** `1–50,000 bp`  
**Screenshot file:** `barcode01_vs_barcode05_illumina.png`

**Observations:**
- `barcode01` shows consistently high coverage.
- `barcode05` displays several regions of low coverage and possible alignment gaps.

**Interpretation:**  
These differences may be due to structural variation or differences in assembly quality between the two samples.

## Long-read comparison (Nanopore)

**Reference contig:** `ENA|CP001953|CP001953.1`  
**Region visualised:** `1–50,000 bp`  
**Screenshot file:** `barcode01_vs_barcode05_longreads.png`

**Observations:**
- `barcode01` has dense, continuous long-read alignment.
- `barcode05` exhibits fragmented coverage and multiple gaps.

**Interpretation:**  
This could indicate structural variants (e.g. deletions, insertions) or incomplete assembly regions in `barcode05`.

---

## References

- Andrews, S. (2010). *FastQC: A quality control tool for high throughput sequence data.* [Babraham Bioinformatics](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- Seemann, T. (2014). *Prokka: rapid prokaryotic genome annotation.* Bioinformatics, 30(14), 2068–2069. https://doi.org/10.1093/bioinformatics/btu153
- Wick, R.R., Schultz, M.B., Zobel, J., & Holt, K.E. (2015). *Bandage: interactive visualization of de novo genome assemblies.* Bioinformatics, 31(20), 3350–3352. https://doi.org/10.1093/bioinformatics/btv383
- Gurevich, A., Saveliev, V., Vyahhi, N., & Tesler, G. (2013). *QUAST: quality assessment tool for genome assemblies.* Bioinformatics, 29(8), 1072–1075. https://doi.org/10.1093/bioinformatics/btt086
- Li, H. (2018). *Minimap2: pairwise alignment for nucleotide sequences.* Bioinformatics, 34(18), 3094–3100. https://doi.org/10.1093/bioinformatics/bty191
- Li, H. & Durbin, R. (2009). *Fast and accurate short read alignment with Burrows-Wheeler transform.* Bioinformatics, 25(14), 1754–1760. https://doi.org/10.1093/bioinformatics/btp324
- [Unicycler – GitHub](https://github.com/rrwick/Unicycler)
- [Bandage – GitHub](https://github.com/rrwick/Bandage)
- [IGV – Broad Institute](https://software.broadinstitute.org/software/igv/)
- [NCBI Reference Genome – CP001953.1](https://www.ncbi.nlm.nih.gov/nuccore/CP001953.1)

Any figures generated by group members are clearly labelled and credited within `results.md`.

---

---

## Author

**Name:** Junfang Hu  
**GitHub:** [@hujunfang888](https://github.com/hujunfang888)  
**Course:** LIFE4136 MSc Bioinformatics – Rotation 1  
**Institution:** University of Nottingham  
**Date:** April 2025
