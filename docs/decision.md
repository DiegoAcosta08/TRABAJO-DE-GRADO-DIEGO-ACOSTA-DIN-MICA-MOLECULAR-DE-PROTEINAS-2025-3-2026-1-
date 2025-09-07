# Documento de Decisión

## Estrategia de modelado
Se seguirá una estrategia **progresiva** en el modelado de la hemoglobina (HbA):

1. **Monómero** (cadena α o β).  
2. **Dímero αβ**.  
3. **Tetrámero α2β2** (forma funcional recomendada por el director).  

Esta progresión permite verificar la estabilidad y validez del modelo en cada nivel de complejidad antes de pasar al siguiente.

---

## Fuerza de campo seleccionada
Se utilizará la fuerza de campo **CHARMM36m**, recomendada para simulaciones de proteínas debido a su parametrización optimizada para estructuras secundarias y dinámicas conformacionales.

---

## Representación del grupo hemo (HEM)
Se adopta la **Opción A: mantener el HEM original del archivo PDB**.  
Esto permite conservar la geometría y coordinación del hierro ya definida experimentalmente en las estructuras cristalográficas de referencia (PDB 2HHB y 1A3N).

---

## Justificación general
- **Estrategia progresiva**: reduce riesgos de errores acumulativos y facilita depuración de problemas en fases tempranas.  
- **CHARMM36m**: estándar de facto en la comunidad de dinámica molecular para proteínas.  
- **HEM del PDB**: se mantiene para asegurar consistencia estructural y evitar problemas de parametrización inicial.  

---

📌 **Próximo paso**: preparar los archivos de entrada para construir y validar los modelos iniciales (monómero, dímero y tetrámero) bajo CHARMM36m.
