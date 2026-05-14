#!/bin/bash

temps=$(seq 545 5 555)
#$(seq 520 20 580)

for T in $temps
do
    folder="T_${T}"
    mkdir -p $folder

    # replace TTT with actual temperature
    sed "s/TTT/${T}/g" input.template > ${folder}/input.lammps
    sed "s/TTT/${T}/g" job.sh > ${folder}/job.sh

    # copy other needed files
    cp restart.150000.dat ${folder}/
    cp graph.pb ${folder}/

    # go into folder and run
    cd $folder

    # example run command (adjust to your system)
    sbatch job.sh

    cd ..
done
