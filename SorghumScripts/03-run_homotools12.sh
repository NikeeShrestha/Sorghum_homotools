#!/bin/bash
#SBATCH --mem-per-cpu=30G
#SBATCH --time=100:00:00
#SBATCH --partition=schnablelab,jclarke,batch,guest
#SBATCH --output=/work/schnablelab/nikees/homotools/SorghumOut/Split12/%x_%a.out
#SBATCH --error=/work/schnablelab/nikees/homotools/SorghumOut/Split12/%x_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nshrestha5@unl.edu

# export XDG_CACHE_HOME=/tmp/$USER/.cache # suggested by Adam
genelist=/work/schnablelab/nikees/homotools/DataBase/BTX623/BTX73_Split12

num_lines=$(wc -l < $genelist)

qrydir=$1
tgtdir=$2

for qry in $qrydir/*.protein.fasta
do
qrybase=$(basename $qry .protein.fasta)
done

for tgt in $tgtdir/*.protein.fasta
do
tgtbase=$(basename $tgt .protein.fasta)
done

for task_id in $(seq 1 $num_lines)
do
  in=$(sed -n "${task_id}p" $genelist)
  outdir=0$(expr \( $task_id + 5000 \) / 5000)
  echo "Processing $in into directory $outdir"
  sh /work/schnablelab/nikees/homotools/SorghumScripts/1m_homomine.sh $in $outdir $qrydir $qrybase $tgtdir $tgtbase
done