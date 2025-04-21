# Group 1 – Barcode01 & Barcode05 Genome Project

This repository contains all scripts, results, and documentation for the analysis of barcode01 and barcode05 using Illumina-only, long-read (ONT), and hybrid assembly methods.

We performed genome assembly, annotation, structure comparison, and method evaluation for each sample.


## Navigation

- [Introduction](#introduction)
- [Installation](#installation)
- [Data Overview](#data-overview)
- [Data](#data)
- [Output files](#output-files)
- [Quality Control & Assembly Evaluation](#quality-control--assembly-evaluation)
- [IGV Visualisation of barcode01 and barcode05](#igv-visualisation-of-barcode01-and-barcode05)
- [References](#references)
- [Author](#author)
-  [Assembly Results & Bandage Graphs](./figures.md)
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

In this project, we analysed two bacterial isolates (barcode01 and barcode05) using both Illumina short reads and Nanopore long reads. Hybrid assemblies were also performed by combining both datasets. For alignment and visualisation, Illumina and Nanopore reads were mapped separately to allow clearer comparison of read coverage and structural differences.

| Data Type       | Format                    | Description                                                                 |
|------------------|----------------------------|------------------------------------------------------------------------------|
| Raw reads        | `.fastq.gz` (Illumina), `.fastq` (Nanopore) | Paired-end Illumina reads and Nanopore long reads for both barcode01 and barcode05 |
| Assembly graphs  | `.gfa`                    | Graphs from Unicycler/SPAdes used for Bandage visualisation                 |
| Genome assemblies| `.fasta`                  | Final assembled contigs for each strategy (Illumina, long-read, hybrid)     |
| Annotations      | `.gff`, `.txt`            | Gene annotation outputs from Prokka (CDS, rRNA, tRNA, summary)              |
| Alignments       | `.bam`, `.bai`            | Alignments of raw reads to assemblies using BWA (Illumina) and minimap2 (long-read) |
| Visualisations   | `.png`                    | Screenshots from Bandage and IGV, stored in `figures/` and `igv_visualisation/` |


---

## Data

### Input files

This project used Illumina and Nanopore sequencing data for two bacterial samples, barcode01 and barcode05. These were processed for Illumina-only, long-read-only, and hybrid genome assembly pipelines.

| File | Description |
|------|-------------|
| `bar01_merged_forward.fastq.gz` | Illumina forward reads (barcode01) |
| `bar01_merged_reverse.fastq.gz` | Illumina reverse reads (barcode01) |
| `bar5merged_forward.fastq.gz` | Illumina forward reads (barcode05) |
| `bar5merged_reverse.fastq.gz` | Illumina reverse reads (barcode05) |
| `Merged_pass.fastq.gz` | Nanopore long reads (barcode01) |
| `bar5_pass_merged.fastq.gz` | Nanopore long reads (barcode05) |
| `001_spades_graph_k069.gfa` | Assembly graph from SPAdes (barcode05 – Illumina-only) |
| `Long_read_assemble/output_dir/assembly.gfa` | Assembly graph from LRA (barcode01 – long-read) |
| `Long_read_assemble/output_dir/assembly.fasta` | Long-read assembly contigs (barcode01) |
| `Bar5/long_assembly/pass_lra/assembly.fasta` | Long-read assembly contigs (barcode05) |
| `Illumina/pass_hybrid/assembly.fasta` | Hybrid assembly (barcode01 – Unicycler) |
| `Bar5/pass_hybrid_bar5/assembly.fasta` | Hybrid assembly (barcode05 – Unicycler) |
| `CP001953.1.fasta` | NCBI reference genome used for long-read alignment in IGV |
| `bar5output_rerun/assembly_bar05.fasta` | Contigs extracted from `.gfa` (barcode05 – Illumina-only) |
| `Illumina/pass_illumina/assembly.fasta` | Illumina-only assembly (barcode01, from Unicycler) |


###  Output files


Output files include annotation results, assembly evaluation, read alignments, and visualisations for each strategy and sample.

| File | Description |
|------|-------------|
| `annotated_bar05.gff` / `.txt` | Prokka output (barcode05 – Illumina-only) |
| `PROKKA_02102025.gff` / `.txt` | Prokka output (barcode05 – long-read) |
| `PROKKA_02132025.gff` / `.txt` | Prokka output (barcode05 – hybrid) |
| `PROKKA_02072025.gff` / `.txt` | Prokka output (barcode01 – Illumina-only) |
| `PROKKA_02062025.gff` / `.txt` | Prokka output (barcode01 – long-read) |
| `PROKKA_02132025.gff` / `.txt` | Prokka output (barcode01 – hybrid) |
| `quast/report.txt` | QUAST summary (contigs, total length, N50, GC%) |
| `*.bam` / `*.bai` | Read alignments from BWA (Illumina) and Minimap2 (Nanopore) |
| `figures/bandage_*.png` | Bandage assembly graph visualisations (6 strategies × samples) |
| `igv_visualisation/Figure1–5.png` | IGV coverage screenshots (Illumina + long-read comparisons) |
| `igv_visualisation/BWA_index_samtool_*.sh` | Scripts used for alignment and sorting of short-read data |
| `igv_visualisation/Minimap_longreads_*.sh` | Scripts used for mapping long reads to CP001953.1 |

## Quality Control & Assembly Evaluation

**FastQC Reports:**

- [Forward reads (barcode01)](https://hujunfang888.github.io/Project-rotation1/merged_forward_fastqc.html)
- [Reverse reads (barcode01)](https://hujunfang888.github.io/Project-rotation1/merged_reverse_fastqc.html)
- [MultiQC summary](https://hujunfang888.github.io/Project-rotation1/fastqc_report.html)


**QUAST Assembly Reports:**

- [Long-read assembly (barcode01)](https://hujunfang888.github.io/Project-rotation1/QUAST_longreads.html)
- [Hybrid assembly (barcode01)](https://hujunfang888.github.io/Project-rotation1/QUAST_hybrid.html)

---
## Bandage Assembly Graph Visualisation

Assembly graphs in `.gfa` format were visualised using Bandage to assess genome structure and contiguity.

 **Input files**:  
   - Illumina: `001_spades_graph_k069.gfa` (barcode05)  
   - Long-read assemblies: `assembly.gfa` (from LRA output for barcode01 and barcode05)
**Steps performed**:  
   - Opened `.gfa` file in Bandage GUI  
   - Selected `Entire Graph` under drawing scope  
   - Toggled node labels for **Name**, **Length**, and **Depth**  
   - Used "Single" style layout with adjusted zoom and width  
   - Exported visualisation as `.png`
**Output**:  
   - Screenshots saved to `figures/` (e.g., `bandage_longreads_bar01.png`)  
   - Compared structures across samples and strategies (fragmentation, circular contigs)

---

## IGV Visualisation of barcode01 and barcode05

### IGV Alignment Inspection
1. **BAM file generation**:
   - Illumina reads aligned to `assembly_bar05.fasta` using `bwa mem`  
   - Long reads mapped to `CP001953.1.fasta` using `minimap2`  
   - Sorted and indexed using `samtools`
2. **Files loaded into IGV**:
   - `assembly_bar05.fasta` or `CP001953.1.fasta` as reference  
   - Corresponding `.sorted.bam` and `.bai` files (barcode01 and barcode05)
3. **Manual steps in IGV**:
   - Opened reference genome in IGV  
   - Loaded alignments from both samples  
   - Navigated to selected contigs/coordinates (e.g., contig_11, 1–50,000 bp)  
   - Took screenshots of normal, low, and high coverage regions
4. **Output**:
Alignment results were visualised using IGV and are summarised in：
[IGV visualisation summary (barcode01 & barcode05)](./igv_visualisation/igv_visualisation.md)

All alignment steps include indexing (`bwa index` / `samtools index`), sorting, and `.bam` file generation.

All scripts used to generate `.bam` files for IGV inspection are stored in the [`igv_visualisation/`](./igv_visualisation/) directory. These include:

- `BWA_index_samtool_illumina_bar1`: Aligns barcode01 Illumina reads to bar05 assembly using BWA and SAMtools.
- `BWA_index_samtool_illumina_bar05`: Aligns barcode05 Illumina reads to bar05 assembly.
- `Minimap_longreads_bar01`: Maps barcode01 long reads to NCBI reference genome CP001953.1.
- `Minimap_longreads_bar05`: Maps barcode05 long reads to the same reference.

Both Bandage and IGV were used to visually assess genome contiguity and read alignment quality.  
All manual steps were performed consistently and are documented with screenshots and scripts.

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

##  Acknowledgements

This project was completed collaboratively as part of the LIFE4136 MSc Bioinformatics Rotation 1. Contributions were divided as follows:

- **Quayyum Abdullahi** – Performed hybrid assemblies, annotation, and quality control (QC) for both barcode01 and barcode05.
- **Samuel Swane** – Completed long-read assemblies, annotation, QC, and developed scripts for Minimap2 alignment of barcode01 and barcode05.
- **Junfang Hu** – Carried out Illumina-only assemblies, annotation, QC, developed BWA alignment scripts, and conducted all visualisation work (Bandage & IGV) for both barcode01 and barcode05.

All reused scripts or results from team members are included with their permission and properly credited.

---

## Author

**Name:** Junfang Hu  
**GitHub:** [@hujunfang888](https://github.com/hujunfang888)  
**Course:** LIFE4136 MSc Bioinformatics – Rotation 1  
**Institution:** University of Nottingham  
**Date:** April 2025
