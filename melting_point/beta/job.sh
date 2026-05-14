#!/bin/bash
#SBATCH -J melt_half_orth
#SBATCH -A ACF-UTK0038
#SBATCH --nodes=10
#SBATCH --ntasks-per-node=40
#SBATCH --partition=condo-dagotto
#SBATCH --qos=condo
#SBATCH --time=72:00:00
#SBATCH -e error.e%j
#SBATCH -o out.o%j

ulimit -s unlimited
ulimit -l unlimited
echo $SLURM_JOB_NODELIST
echo $SLURM_NTASKS

source ~/bin/deepmd.sh
which lmp
date
srun -n 400 lmp -in input.lammps
date

