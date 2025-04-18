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
```

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

[See IGV screenshot comparison here](./igv_visualisation/README.md)


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

- **Unicycler**: Wick RR, et al. (2017). *Unicycler: Resolving bacterial genome assemblies from short and long sequencing reads.* [PLOS Computational Biology](https://doi.org/10.1371/journal.pcbi.1005595)
- **Prokka**: Seemann T. (2014). *Prokka: Rapid prokaryotic genome annotation.* [Bioinformatics](https://doi.org/10.1093/bioinformatics/btu153)
- **SPAdes**: Bankevich A, et al. (2012). *SPAdes: A new genome assembly algorithm and its applications to single-cell sequencing.* [Journal of Computational Biology](https://doi.org/10.1089/cmb.2012.0021)
- **Bandage**: Wick RR, et al. (2015). *Bandage: Interactive visualization of de novo genome assemblies.* [Bioinformatics](https://doi.org/10.1093/bioinformatics/btv383)
- **FastQC**: [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- **MultiQC**: Ewels P, et al. (2016). *MultiQC: Summarize analysis results for multiple tools and samples in a single report.* [Bioinformatics](https://doi.org/10.1093/bioinformatics/btw354)
- **QUAST**: Gurevich A, et al. (2013). *QUAST: quality assessment tool for genome assemblies.* [Bioinformatics](https://doi.org/10.1093/bioinformatics/btt086)
- **Minimap2**: Li H. (2018). *Minimap2: pairwise alignment for nucleotide sequences.* [Bioinformatics](https://doi.org/10.1093/bioinformatics/bty191)
- **Samtools**: Danecek P, et al. (2021). *Twelve years of SAMtools and BCFtools.* [GigaScience](https://doi.org/10.1093/gigascience/giab008)
