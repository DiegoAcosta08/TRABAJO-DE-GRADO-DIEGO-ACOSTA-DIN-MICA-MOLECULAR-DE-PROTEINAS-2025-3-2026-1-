# Tutorial: Lysozyme in Water with GROMACS

## Purpose
Introductory tutorial to the molecular dynamics pipeline with GROMACS,
used as practice before simulating the αβ dimer of hemoglobin.
This tutorial follows the classic Lemkul protocol (Lysozyme in Water)
adapted for GROMACS 2026.1 with GPU acceleration (CUDA).

## Protein
Hen egg white lysozyme — PDB: 1AKI

## Software
- GROMACS 2026.1 (compiled with MPI + CUDA)
- GPU: NVIDIA T1000 8GB
- OS: Debian 12

## Force Field
OPLS-AA/L (option 17 in GROMACS 2026.1)

## Water Model
TIP3P

## Full Protocol

### Step 1 — Prepare the Topology
Download the protein and remove crystal waters:
wget https://files.rcsb.org/download/1AKI.pdb
grep -v HOH 1AKI.pdb > 1AKI_clean.pdb

Generate topology:
gmx_mpi pdb2gmx -f 1AKI_clean.pdb -o 1AKI_processed.gro -water tip3p
Select OPLS-AA/L when prompted.

Files generated:
- 1AKI_processed.gro — processed coordinates
- topol.top — system topology
- posre.itp — position restraints

### Step 2 — Examine the Topology
Inspect topol.top to understand the system structure,
force field parameters, atom types, charges, and molecule definitions.

### Step 3 — Define the Box and Add Solvent
Define cubic box with 1.0 nm margin:
gmx_mpi editconf -f 1AKI_processed.gro -o 1AKI_newbox.gro -c -d 1.0 -bt cubic

Result: 7.01 x 7.01 x 7.01 nm box

Add TIP3P water:
gmx_mpi solvate -cp 1AKI_newbox.gro -cs spc216.gro -o 1AKI_solv.gro -p topol.top

Result: 10,644 water molecules added

### Step 4 — Add Ions
Generate ions.tpr:
gmx_mpi grompp -f ions.mdp -c 1AKI_solv.gro -p topol.top -o ions.tpr -maxwarn 1

Add 8 Cl⁻ ions to neutralize the +8 net charge of the protein:
gmx_mpi genion -s ions.tpr -o 1AKI_solv_ions.gro -p topol.top -pname NA -nname CL -nn 8
Select group 13 (SOL) when prompted.

### Step 5 — Energy Minimization
gmx_mpi grompp -f minim.mdp -c 1AKI_solv_ions.gro -p topol.top -o em.tpr
gmx_mpi mdrun -v -deffnm em -nb gpu -ntomp 20

Results obtained:
- Epot = -529,601 kJ/mol ✅
- Fmax = 980.7 kJ/mol/nm < 1000 ✅
- Converged in 801 steps ✅

### Step 6 — NVT Equilibration (100 ps)
gmx_mpi grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr
gmx_mpi mdrun -deffnm nvt -nb gpu -ntomp 20

Result: temperature stable at 300 K ✅

### Step 7 — NPT Equilibration (100 ps)
gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr
gmx_mpi mdrun -deffnm npt -nb gpu -ntomp 20

Results obtained:
- Average pressure: -2.94 bar (acceptable) ✅
- Average density: 1006.53 kg/m³ ✅

### Step 8 — Production MD (1 ns)
gmx_mpi grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_1.tpr
gmx_mpi mdrun -deffnm md_0_1 -nb gpu -ntomp 20

Performance: ~140 ns/day with T1000 GPU ✅

### Step 9 — Analysis
Correct for periodicity:
gmx_mpi trjconv -s md_0_1.tpr -f md_0_1.xtc -o md_0_1_noPBC.xtc -pbc mol -ur compact
Select group 0 (System).

Calculate RMSD:
gmx_mpi rms -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsd.xvg -tu ns
Select group 4 (Backbone) for both prompts.

Calculate radius of gyration:
gmx_mpi gyrate -s md_0_1.tpr -f md_0_1_noPBC.xtc -o gyrate.xvg
Select group 1 (Protein).

## Final Results

| Metric | Value | Status |
|---|---|---|
| Epot (minimization) | -529,601 kJ/mol | ✅ |
| Fmax | 980.7 kJ/mol/nm | ✅ |
| Temperature | 300 K stable | ✅ |
| Density | 1006.53 kg/m³ | ✅ |
| Backbone RMSD | ~0.1 nm stable | ✅ |
| Radius of gyration | ~1.41-1.44 nm stable | ✅ |

## Conclusion
Lysozyme remained stable throughout 1 ns of simulation,
confirming that the MD protocol is correct and reproducible.
This pipeline is the foundation of the protocol that will
be applied to the αβ hemoglobin dimer.

## Differences with respect to the hemoglobin pipeline

| Parameter | Lysozyme (tutorial) | Hemoglobin (project) |
|---|---|---|
| Force field | OPLS-AA/L | CHARMM36m / AMBER ff14SB |
| Box type | Cubic | Dodecahedral |
| Box margin | 1.0 nm | >1.5 nm |
| Production length | 1 ns | 25-50 ns |
| Cofactor | None | Heme group |
| System | Monomer | αβ dimer |
| Ions | Neutralization only | Physiological concentration |

## Reference
Original tutorial: Lemkul J.A., "Lysozyme in Water",
adapted by Sillanpää A., CSC - IT Center for Science Ltd.

---

Note: the .mdp parameter files (ions.mdp, minim.mdp, nvt.mdp,
npt.mdp, md.mdp) will be added manually to this folder.
