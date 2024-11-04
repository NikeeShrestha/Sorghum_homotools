#!/bin/bash
qrygene=$1
run=$2
qrydir=$3
qrybase=$4
tgtdir=$5
tgtbase=$6

folder=$(basename $tgtdir)

parentdir=/scratch/"$folder"_homomine
outdir=${parentdir}/${run}

if [ ! -d $parentdir ]; then
    mkdir $parentdir
fi

if [ ! -d $outdir ]; then
    mkdir $outdir
    
fi   
resultdir=/work/schnablelab/nikees/homotools/DataBase_Results/"$folder"_homomine

# Step 1: Create directories if they don't exist
mkdir -p "$parentdir"
mkdir -p "$outdir"
mkdir -p "$resultdir"


if [ ! -f ${outdir}/${qrygene}/${qrygene}.homomine.report.html ]; then
    pushd $outdir
    /work/schnablelab/nikees/homotools/./homomine \
        --qrygene $qrygene \
        --qrydir $qrydir \
        --qrybase $qrybase \
        --tgtdir $tgtdir \
        --tgtbase $tgtbase \
        --cleanup
fi

cd "$outdir" || exit

zip -r9 $resultdir/$qrygene.zip $qrygene