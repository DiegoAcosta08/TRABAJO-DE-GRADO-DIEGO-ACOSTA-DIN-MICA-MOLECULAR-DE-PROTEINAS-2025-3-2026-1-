# Pipeline de modelado y simulación (versión inicial)

Este documento describe el flujo de trabajo adoptado para el modelado y simulación de la hemoglobina humana (HbA).

---

## 1. Recolección de secuencias
- Obtención de secuencias FASTA de **HBA1, HBA2 y HBB** desde UniProt.

## 2. Descarga de estructuras de referencia
- Selección de PDBs experimentales:
  - Desoxi Hb: `2HHB`, Desoxi Hb:`1A3N`
  - Oxi Hb: `1HH0`

## 3. Preparación estructural
- Limpieza de las cadenas α y β.
- Incorporación de protonación adecuada.
- Tratamiento del grupo hemo (HEM).

## 4. Selección de parámetros de simulación
- Fuerza de campo: **CHARMM36m** (recomendado).
- Modelo de agua: **TIP3P**.

## 5. Construcción del sistema
- Inserción de la proteína en una caja de agua.
- Neutralización del sistema con iones.

## 6. Simulación de dinámica molecular
- Minimización de energía.
- Equilibración en etapas.
- Simulación de producción.

## 7. Análisis de trayectorias
- Estabilidad estructural (RMSD, RMSF).
- Interacciones HEM-proteína.
- Propiedades estructurales relevantes.

---

✍ *El pipeline será refinado conforme se avance en las simulaciones.*
