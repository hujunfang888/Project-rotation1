# Barcode01 – Illumina-only Assembly and Annotation Results

## Assembly

- Sample: barcode01
- Reads: Illumina paired-end
- Assembly method: Unicycler (short-read mode)
- Graph file: `001_spades_graph_k069.gfa`
- Contigs extracted: `assembly_bar01.fasta` (from `.gfa`)

**Assembly summary**
- Contigs: 154
- Total bases: 3,891,985 bp

---

## Annotation (Prokka)

- Tool: Prokka v1.14.6
- Output folder: `PROKKA_02072025`
- Annotated from: `assembly_bar01.fasta`

**Annotation summary**
- CDS (protein-coding): 3,881
- rRNA: 3
- tRNA: 49
- Repeat regions: 3

---

## Output Files

| File | Description |
|------|-------------|
| `PROKKA_02072025.gff` | Genome annotation |
| `PROKKA_02072025.faa` | Predicted protein sequences |
| `PROKKA_02072025.txt` | Annotation summary |
| `assembly_bar01.fasta` | Contigs extracted from `.gfa` |
