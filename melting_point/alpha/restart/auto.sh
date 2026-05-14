#!/bin/bash

temps="605"
#$(seq 610 5 625)
#$(seq 600 40 680)
#"500 700"
#$(seq 545 5 555)
#$(seq 520 20 580)

for T in $temps
do
    folder="T_${T}"
    mkdir -p $folder

    # replace TTT with actual temperature
    sed "s/TTT/${T}/g" input.template > ${folder}/input.lammps
    sed "s/TTT/${T}/g" job.sh > ${folder}/job.sh

    # copy other needed files
    cp melt_half_sn.data ${folder}/
    cp graph.pb ${folder}/

    # go into folder and run
    cd $folder

    # example run command (adjust to your system)
    sbatch job.sh

    cd ..
done
