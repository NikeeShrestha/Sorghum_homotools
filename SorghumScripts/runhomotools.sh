#!/bin/bash
#SBATCH --mem-per-cpu=30G
#SBATCH --time=100:00:00
#SBATCH --partition=schnablelab,jclarke,batch,guest
#SBATCH --output=/work/schnablelab/nikees/homotools/SorghumOut/%x_%a.out
#SBATCH --error=/work/schnablelab/nikees/homotools/SorghumOut/%x_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nshrestha5@unl.edu

ml anaconda
conda activate homotools

qrydir=/work/schnablelab/nikees/homotools/DataBase/BTX623

for i in /work/schnablelab/nikees/homotools/DataBase/*;

do 

    echo $i
    
    tgtdir=$i

    for j in  /work/schnablelab/nikees/homotools/SorghumScripts/03-*;
    
    do 
    
        echo $j
        
        sbatch $j $qrydir $tgtdir
    
    done

done