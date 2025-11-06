# Documentación del Proyecto: Dinámica Molecular de Hemoglobina Humana (HbA)

Este documento centraliza la información clave del proyecto, incluyendo el pipeline de modelado, las decisiones estratégicas y los próximos pasos.

---

## 1. Estrategia de Modelado

Se seguirá una estrategia **progresiva** en el modelado de la hemoglobina (HbA):

1. **Monómero** (cadena α o β).
2. **Dímero αβ**.
3. **Tetrámero α2β2** (forma funcional recomendada por el director).

Esta progresión permite verificar la estabilidad y validez del modelo en cada nivel de complejidad antes de pasar al siguiente.

---

## 2. Pipeline de Modelado y Simulación

A continuación, se describe el flujo de trabajo adoptado para el modelado y simulación de la HbA.

### 2.1. Recolección de Secuencias
- Obtención de secuencias FASTA de **HBA1, HBA2 y HBB** desde UniProt.

### 2.2. Descarga de Estructuras de Referencia
- Selección de PDBs experimentales:
  - Desoxi Hb: `2HHB`, `1A3N`
  - Oxi Hb: `1HH0`

### 2.3. Preparación Estructural
- Limpieza de las cadenas α y β.
- Incorporación de protonación adecuada.
- Tratamiento del grupo hemo (HEM).

### 2.4. Selección de Parámetros de Simulación
- **Fuerza de campo**: Se utilizará **CHARMM36m**, recomendada para simulaciones de proteínas debido a su parametrización optimizada.
- **Modelo de agua**: **TIP3P**.
- **Representación del grupo hemo (HEM)**: Se adopta la **Opción A: mantener el HEM original del archivo PDB** para conservar la geometría y coordinación del hierro definidas experimentalmente.

### 2.5. Construcción del Sistema
- Inserción de la proteína en una caja de agua.
- Neutralización del sistema con iones.

### 2.6. Simulación de Dinámica Molecular
- Minimización de energía.
- Equilibración en etapas.
- Simulación de producción.

### 2.7. Análisis de Trayectorias
- Estabilidad estructural (RMSD, RMSF).
- Interacciones HEM-proteína.
- Propiedades estructurales relevantes.

---

## 3. Justificación de Decisiones Clave

- **Estrategia progresiva**: Reduce riesgos de errores acumulativos y facilita la depuración en fases tempranas.
- **CHARMM36m**: Es el estándar de facto en la comunidad de dinámica molecular para proteínas.
- **HEM del PDB**: Asegura consistencia estructural y evita problemas de parametrización inicial.

---

📌 **Próximo paso**: Preparar los archivos de entrada para construir y validar los modelos iniciales (monómero, dímero y tetrámero) bajo CHARMM36m.
