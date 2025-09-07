# Dinámica Molecular de Hemoglobina Humana (HbA)

## Objetivos del proyecto
- Implementar un pipeline computacional para el modelado y simulación de la hemoglobina humana (HbA).
- Estudiar la estabilidad estructural y la influencia del grupo hemo (HEM) en un estado de oxigenación fijo.
- Generar un flujo de trabajo reproducible que permita extender el análisis a variantes y estados funcionales de la proteína.

## Alcance
El presente proyecto se centrará en la hemoglobina tetramérica humana (α₂β₂) en un **estado fijo de oxigenación** (desoxi u oxi, según la referencia PDB seleccionada).  
El objetivo inicial no es explorar todos los estados funcionales, sino establecer un protocolo sólido de preparación, modelado y simulación en condiciones controladas.

## Pipeline de modelado (versión inicial)
1. **Recolección de secuencias FASTA**: obtención de HBA1, HBA2 y HBB desde UniProt.
2. **Descarga de estructuras de referencia**: selección de PDBs experimentales de HbA (ej. 2HHB, 1A3N).
3. **Preparación estructural**: limpieza de las cadenas, incorporación de protonación adecuada y tratamiento del grupo hemo (HEM).
4. **Selección de parámetros de simulación**: fuerza de campo (CHARMM36m recomendado) y modelo de agua (TIP3P).
5. **Construcción del sistema**: empaquetado en caja de agua con iones para neutralización.
6. **Simulación de dinámica molecular**: ejecución de protocolos de minimización, equilibración y producción.
7. **Análisis de trayectorias**: evaluación de estabilidad (RMSD, RMSF), interacciones HEM-proteína y propiedades estructurales relevantes.

---

📂 **Estructura del repositorio (inicial):**
- `/data`: secuencias FASTA y PDBs de referencia.
- `README.md`: objetivos, alcance y pipeline (este documento).
- (A futuro) `/scripts`, `/results`, `/docs`.

---

Para consultar más a profundidad sobre los pasos o decisiones tomadas a lo largo de la implementación del Trabajo de Grado consultar: /docs

---

✍️ *Este README será actualizado a medida que avance el proyecto y se incorporen resultados, nuevos análisis y mejoras en el pipeline.*

