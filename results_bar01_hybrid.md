# Barcode01 – Hybrid Assembly and Annotation Results

## Assembly (Hybrid)

- Sample: barcode01
- Data: Illumina + ONT long reads
- Assembler: Unicycler (hybrid mode)
- Output path: `pass_hybrid/`
- Final assembly file: `assembly.fasta`
- Graph file: `assembly.gfa`

**Assembly summary**
- Contigs: 3
- Total bases: 4,009,219 bp

---

## Annotation (Prokka)

- Tool: Prokka v1.14.6
- Output folder: `PROKKA_02132025`
- Annotated from: `assembly.fasta`

**Annotation summary**
- CDS (protein-coding sequences): 4,007
- rRNA: 6
- tRNA: 55
- Repeat regions: 3

---

##  Output Files

| File | Description |
|------|-------------|
| `PROKKA_02132025.gff` | Genome annotation (hybrid assembly) |
| `PROKKA_02132025.faa` | Predicted protein sequences |
| `PROKKA_02132025.txt` | Summary of annotated features |
| `assembly.fasta` | Final hybrid assembly |
| `assembly.gfa` | Graph for visualization (Bandage) |

---

This hybrid assembly combines the high accuracy of Illumina reads and the long-range structure from ONT data, providing high contiguity and annotation quality.
