# Results Summary – Barcode01 & Barcode05

This file summarizes the genome assembly and annotation results for samples barcode01 and barcode05 across different sequencing strategies. Results include contiguity statistics (QUAST), gene annotation (Prokka), and visual inspection of assembly graphs (Bandage).

## Contribution Statement

This project involved collaborative work across other team members. Specific responsibilities were as follows:

- **Quayyum Abdullahi**: Responsible for hybrid assembly, annotation, and quality control (QC) of barcode01 and barcode05.
- **Samuel Swane**: Responsible for long-read assembly, annotation, QC, and Minimap2-based alignment of barcode01 and barcode05.
- **Junfang Hu**: Responsible for Illumina-only assembly, annotation, QC, BWA alignment scripts, and all visualisation work (Bandage and IGV) for barcode01 and barcode05.


---

## IGV Visualisation & Alignment Scripts

IGV was used to compare barcode01 and barcode05 at specific genomic regions. All read alignments were performed using BWA (for Illumina reads) and Minimap2 (for long reads). Final `.bam` and `.bai` files were loaded in IGV along with the relevant assemblies or reference genome.

### Available scripts (see [`igv_visualisation/`](./igv_visualisation/)):

| Script | Description |
|--------|-------------|
| `BWA_index_samtool_illumina_bar1` | Aligns barcode01 Illumina reads to barcode05 assembly (BWA + samtools) |
| `BWA_index_samtool_illumina_bar05` | Aligns barcode05 Illumina reads to its own assembly |
| `Minimap_longreads_bar01` | Aligns barcode01 long reads to CP001953.1 reference |
| `Minimap_longreads_bar05` | Aligns barcode05 long reads to CP001953.1 reference |
| `igv_visualisation.md` | Screenshots and interpretation of five key genomic regions |

Summary of visual findings available here:  
[`IGV Visualisation Report`](./igv_visualisation/igv_visualisation.md)

---

## Sample: Barcode01

### Illumina-only Assembly
- **Assembler:** Unicycler  
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
![barcode01 illumina](figures/bandage_Illumina_bar01.png)

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
![barcode01 long-read](figures/bandage_longreads_bar01.png)

---

### Hybrid Assembly
- **Assembler:** Unicycler  
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
![barcode01 hybrid](figures/bandage_hybrid_bar01.png)

---

## Sample: Barcode05

### Illumina-only Assembly
- **Assembler:** Unicycler 
- **Contigs:** 737  
- **Total length:** 3,965,967 bp    

**Prokka Annotation Summary:**  
- CDS: 3917  
- rRNA: 3  
- tRNA: 51  
- Repeat regions: 3  

**Bandage Graph Summary:**  
Severely fragmented graph with 700+ contigs and no major circular structures. A highly fragmented structure with more contigs than barcode01. The complexity suggests lower continuity, likely due to incomplete assembly from short reads.  
![barcode05 illumina](figures/bandage_Illumina_bar05.png)

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
Similar to barcode01, this long-read assembly shows a dominant circular contig with two smaller components, supporting good genome completeness.
![barcode05 long-read](figures/bandage_longreads_bar05.png)

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
This hybrid assembly displays a complete circular contig along with two accessory contigs, mirroring the long-read result and confirming consistency. 
![barcode05 hybrid](figures/bandage_hybrid_bar05.png)

---

## Interpretation & Notes

- Barcode01’s hybrid assembly gave the most complete and consistent genome, closely followed by long-read-only.
- Illumina-only assemblies were more fragmented, especially for barcode05.
- Bandage graphs clearly show the contrast in structure quality across sequencing strategies.
- Annotation counts support the continuity metrics—more complete assemblies yield more predicted genes and RNAs.

---

## File References

QUAST summaries, Bandage visualisations, IGV screenshots, and Prokka `.gff` outputs are all included in the `figures/`, `igv_visualisation/`, and documented in `results.md`.  
This document was written based on direct observation of the assemblies and graph structures, aiming for clarity and objectivity without overinterpreting limited datasets.

