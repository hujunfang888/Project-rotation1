# Barcode01 – Long-read Assembly and Annotation Results

## Assembly (Long-read)

- Sample: barcode01
- Sequencing: Oxford Nanopore (ONT) long reads
- Assembly tool: Unicycler
- Output file: `assembly.fasta`
- Graph file: `assembly.gfa`
- Location: `/Long_read_assemble/output_dir/`

**Assembly summary**
- Contigs: 3
- Total bases: 4,008,716 bp

---

## Annotation (Prokka)

- Tool: Prokka v1.14.6
- Output folder: `PROKKA_02062025`
- Annotated from: `assembly.fasta`

**Annotation summary**
- CDS (protein-coding sequences): 4,252
- rRNA: 6
- tRNA: 55
- Repeat regions: 3

---

## Output Files

| File | Description |
|------|-------------|
| `PROKKA_02062025.gff` | Genome annotation in GFF format |
| `PROKKA_02062025.faa` | Protein sequences |
| `PROKKA_02062025.txt` | Annotation summary |
| `assembly.fasta` | Final assembled contigs |
| `assembly.gfa` | Assembly graph (for Bandage) |

---

This is the result of long-read assembly and annotation for barcode01. Hybrid and Illumina versions are available in other folders.
