# Results Summary – Barcode01 & Barcode05

This file summarizes the genome assembly and annotation results for samples barcode01 and barcode05 across different sequencing strategies. Results include contiguity statistics (QUAST), gene annotation (Prokka), and visual inspection of assembly graphs (Bandage).

---

## Sample: Barcode01

### Illumina-only Assembly
- **Assembler:** Unicycler (SPAdes)  
- **Contigs:** 154  
- **Total length:** 3,891,985 bp  
- **GC content:** 65.74%  
- **N50:** 167,656 bp  
- **L50:** 9  

**Prokka Annotation Summary:**  
- CDS: 3881  
- rRNA: 3  
- tRNA: 49  
- Repeat regions: 3  

**Bandage Graph Summary:**  
The graph is highly fragmented with no apparent circular contig. Over 300 contigs cluster in a tangled central region, indicating that Illumina-only data struggles to resolve full genomic structure.  
![barcode01 illumina](figures/barcode01_illumina_bandage.png)

---

### Long-read Assembly
- **Assembler:** LRA + minimap2  
- **Contigs:** 3  
- **Total length:** 4,008,716 bp  
- **GC content:** 65.48%  
- **N50:** 3,485,407 bp  
- **L50:** 1  

**Prokka Annotation Summary:**  
- CDS: 4252  
- rRNA: 6  
- tRNA: 55  
- Repeat regions: 3  

**Bandage Graph Summary:**  
A clean and simple graph with a single large circular contig and two small unconnected ones. This reflects a high-contiguity assembly with likely full chromosomal recovery.  
![barcode01 long-read](figures/barcode01_longread_bandage_labeled.png)

---

### Hybrid Assembly
- **Assembler:** Unicycler hybrid mode  
- **Contigs:** 3  
- **Total length:** 4,009,219 bp  
- **GC content:** 65.49%  
- **N50:** 3,486,218 bp  
- **L50:** 1  

**Prokka Annotation Summary:**  
- CDS: 4007  
- rRNA: 6  
- tRNA: 55  
- Repeat regions: 3  

**Bandage Graph Summary:**  
Graph structure nearly identical to the long-read assembly, confirming that hybrid sequencing provides strong structural accuracy. All three contigs are clearly resolved.  
![barcode01 hybrid](figures/barcode01_hybrid_bandage.png)

---

## Sample: Barcode05

### Illumina-only Assembly
- **Assembler:** Unicycler (SPAdes)  
- **Contigs:** 737  
- **Total length:** 3,965,967 bp  
- **GC content:** N/A  
- **N50 / L50:** Not reliable due to fragmentation  

**Prokka Annotation Summary:**  
- CDS: 3917  
- rRNA: 3  
- tRNA: 51  
- Repeat regions: 3  

**Bandage Graph Summary:**  
Severely fragmented graph with 700+ contigs and no major circular structures. The layout is dense and tangled, reflecting a low-continuity assembly.  
![barcode05 illumina](figures/barcode05_illumina_bandage.png)

---

### Long-read Assembly
- **Assembler:** LRA + minimap2  
- **Contigs:** 3  
- **Total length:** 4,005,591 bp  
- **GC content:** 65.49%  
- **N50:** 3,482,736 bp  
- **L50:** 1  

**Prokka Annotation Summary:**
- CDS: 4385  
- rRNA: 6  
- tRNA: 54  
- Repeat regions: 3

**Bandage Graph Summary:**  
One complete circular contig and two smaller segments are visible, mirroring the barcode01 graph and suggesting a similar genome architecture.  
![barcode05 long-read](figures/barcode05_longread_bandage_labeled.png)

---

### Hybrid Assembly
- **Assembler:** Unicycler 
- **Contigs:** 3  
- **Total length:** 4,009,219 bp  
- **GC content:** 65.49%  
- **N50:** 3,486,288 bp  
- **L50:** 1  

**Prokka Annotation Summary:**
- CDS: 4004  
- rRNA: 6  
- tRNA: 55  
- Repeat regions: 3

**Bandage Graph Summary:**  
The hybrid assembly is essentially identical to the long-read result. The graph shows a circular chromosome and two accessory elements with good read depth.  
![barcode05 hybrid](figures/barcode05_hybrid_bandage.png)

---

## Interpretation & Notes

- Barcode01’s hybrid assembly gave the most complete and consistent genome, closely followed by long-read-only.
- Illumina-only assemblies were more fragmented, especially for barcode05.
- Bandage graphs clearly show the contrast in structure quality across sequencing strategies.
- Annotation counts support the continuity metrics—more complete assemblies yield more predicted genes and RNAs.

---

## File References

All result files, QUAST reports, Bandage screenshots, and Prokka outputs are located in the `results/`, `qc_reports/`, and `prokka_*` directories of this repository.

This document was written based on direct observation of the assemblies and graph structures, aiming for clarity and objectivity without overinterpreting limited datasets.

