# Results Summary – Barcode01 & Barcode05

This file summarizes the genome assembly and annotation results for samples barcode01 and barcode05 across different sequencing strategies.

---

##  Sample: Barcode01

###  Illumina-only Assembly

- **Assembler**: Unicycler (SPAdes)
- **Contigs**: 154
- **Total length**: 3,891,985 bp
- **GC content**: 65.74%
- **N50**: 167,656 bp
- **L50**: 9

**Prokka Annotation Summary:**
- **CDS**: 3881
- **rRNA**: 3
- **tRNA**: 49
- **Repeat regions**: 3

---

###  Long-read Assembly

- **Assembler**: Long-read + minimap2
- **Contigs**: 3
- **Total length**: 4,008,716 bp
- **GC content**: 65.48%
- **N50**: 3,485,407 bp
- **L50**: 1

**Prokka Annotation Summary:**
- **CDS**: 4252
- **rRNA**: 6
- **tRNA**: 55
- **Repeat regions**: 3

---

### 🔬 Hybrid Assembly

- **Assembler**: Unicycler hybrid mode
- **Contigs**: 3
- **Total length**: 4,009,219 bp
- **GC content**: 65.49%
- **N50**: 3,486,218 bp
- **L50**: 1

**Prokka Annotation Summary:**
- **CDS**: 4007
- **rRNA**: 6
- **tRNA**: 55
- **Repeat regions**: 3

---

## Sample: Barcode05

### Illumina-only Assembly

- **Assembler**: Unicycler (SPAdes)
- **Contigs**: 737
- **Total length**: 3,965,967 bp
- **GC content**: N/A
- **N50**: Unknown
- **L50**: Unknown

**Prokka Annotation Summary:**
- **CDS**: 3917
- **rRNA**: 3
- **tRNA**: 51
- **Repeat regions**: 3

Note: Only Illumina data was fully processed for barcode05 due to time/resource constraints. Long-read and hybrid assemblies were not finalized.

---

## Interpretation & Notes

- Barcode01 hybrid assembly produced the most contiguous and complete assembly.
- Long-read-only also yielded very high contiguity (3 contigs, L50=1).
- Illumina-only assemblies had high fragmentation, especially for barcode05.
- Annotation statistics correlate well with contig continuity and genome completeness.

---

##  File References

All result files, QUAST reports, and Prokka outputs are available in the `results/`, `qc_reports/`, and `prokka_*` folders of this repository.

