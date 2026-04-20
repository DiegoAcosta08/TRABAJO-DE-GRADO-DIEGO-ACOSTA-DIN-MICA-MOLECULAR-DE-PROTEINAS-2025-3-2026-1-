# ============================================================
# Script de validación estructural - PyMOL
# Proyecto: Dinámica Molecular de Hemoglobina
# Autor: Diego Acosta - Universidad Distrital Francisco José de Caldas
# Fecha: 2026-04-20
# ============================================================

# --- Cargar modelos AF2 ---
load ../../data/alphafold_models/HBA1_monomer_338a3.result/HBA1_monomer_338a3/HBA1_monomer_338a3_unrelaxed_rank_001_alphafold2_ptm_model_4_seed_000.pdb, HBA1_AF2
load ../../data/alphafold_models/HBB_monomer_639b6_0.result/HBB_monomer_639b6_0/HBB_monomer_639b6_0_unrelaxed_rank_001_alphafold2_ptm_model_5_seed_000.pdb, HBB_AF2

# --- Cargar referencias cristalográficas ---
load ../../data/pdb_references/2HHB.pdb, 2HHB
load ../../data/pdb_references/1HHO.pdb, 1HHO
load ../../data/pdb_references/1A3N.pdb, 1A3N

# --- Extraer cadenas alpha ---
create 2HHB_chainA, 2HHB and chain A and polymer
create 1HHO_chainA, 1HHO and chain A and polymer
create 1A3N_chainA, 1A3N and chain A and polymer

# --- Extraer cadenas beta ---
create 2HHB_chainB, 2HHB and chain B and polymer
create 1HHO_chainB, 1HHO and chain B and polymer
create 1A3N_chainB, 1A3N and chain B and polymer

# --- Alineamientos HBA1 ---
align HBA1_AF2, 2HHB_chainA
align HBA1_AF2, 1HHO_chainA
align HBA1_AF2, 1A3N_chainA

# --- Alineamientos HBB ---
align HBB_AF2, 2HHB_chainB
align HBB_AF2, 1HHO_chainB
align HBB_AF2, 1A3N_chainB
