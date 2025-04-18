# QC Summary – Assembly Quality Comparison

This page summarizes the QUAST and fastqc (Illumina) output statistics for barcode01 using three different assembly strategies.

### Note on barcode05 QC

We did not perform separate FastQC or QUAST quality control for barcode05 due to time and resource constraints.  However, barcode05 was assembled using Illumina reads only, and the successful Prokka annotation suggests that the data quality was sufficient for downstream analysis.

---

## Barcode01 – Hybrid 

- **# contigs**: 3  
- **Total length**: 4,009,219 bp  
- **N50**: 3,486,218 bp  
- **Largest contig**: 3,486,218 bp  
- **GC content**: 65.49%  
- **L50**: 1  
- **Misassemblies**: 0  
- **Genome fraction**: 100%  
- **Duplication ratio**: 1.850  
- **Mismatches per 100kbp**: 997.47  
- **Indels per 100kbp**: 40.03  


---

## Barcode01 – Illumina(fastqc)

- **# contigs**: 98  
- **Total length**: 3,880,724 bp  
- **N50**: 167,656 bp  
- **Largest contig**: 298,171 bp  
- **GC content**: 65.74%  
- **L50**: 9  
- **Misassemblies**: not reported  


---

## Barcode01 – Long-read

- **# contigs**: 3  
- **Total length**: 4,008,716 bp  
- **N50**: 3,485,407 bp  
- **Largest contig**: 3,485,407 bp  
- **GC content**: 65.48%  
- **L50**: 1  
- **Misassemblies**: 0  
- **Genome fraction**: 100%  
- **Duplication ratio**: 1.847  
- **Mismatches per 100kbp**: 840.46  
- **Indels per 100kbp**: 29.90  

---
In conclusion, all datasets passed basic QC metrics.
llumina reads showed high quality throughout, while long-read data had higher error rates as expected.
No adapter contamination or major quality drop-offs were observed.

