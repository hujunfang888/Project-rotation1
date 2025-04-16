# Group 1 – Barcode05 Illumina Assembly and Annotation。

## Assembly (Illumina only)

- We used paired-end Illumina reads: `bar5merged_forward.fastq.gz` and `bar5merged_reverse.fastq.gz`
- Assembly was done with SPAdes through Unicycler (short-read mode)
- Since the Unicycler run didn’t finish completely, we extracted contigs from the `k=69` graph and created `assembly_bar05.fasta`
- Final assembly stats:
  - Number of contigs: 737
  - Total length: 3,965,967 bp

## Annotation (Prokka)

- We annotated the `assembly_bar05.fasta` file using Prokka v1.14.6
- Output directory: `prokka_bar05_v3`
- Summary:
  - CDS (protein-coding genes): 3,917
  - rRNA genes: 3
  - tRNA genes: 51
  - Repeat regions: 3

## Key Output Files

| File | Description |
|------|-------------|
| `assembly_bar05.fasta` | Assembled contigs (from `.gfa`) |
| `annotated_bar05.gff` | Main annotation file |
| `annotated_bar05.faa` | Predicted proteins |
| `annotated_bar05.tsv` | Feature table |
| `annotated_bar05.txt` | Summary of annotation |

---

This is the summary for the barcode05 Illumina dataset
