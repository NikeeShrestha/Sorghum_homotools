#!/bin/sh
#SBATCH --mem-per-cpu=30G
#SBATCH --time=100:00:00
#SBATCH --partition=jclarke,batch,guest
#SBATCH --output=/work/schnablelab/nikees/homotools/SorghumOut/%x_%a.out
#SBATCH --error=/work/schnablelab/nikees/homotools/SorghumOut/%x_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nshrestha5@unl.edu

for i in /work/schnablelab/nikees/homotools/DataBase_Results/*;

do

echo $i

cd "$i"

rm -r *

done