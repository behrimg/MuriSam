#!/bin/bash

cd /N/dc2/projects/muri2/SamMuri/Breseq

AR=(<Sample Names>)

for i in "${AR[@]}"

do
echo "cd /N/dc2/projects/muri2/SamMuri/Breseq" > Year2_BreSeq_${i}
echo "breseq -j 8 -p -o Sample${i}_Year2 -r Ecoli.seq.gb ../Year_2/Sample_${i}/Sample_${i}_R1_trimmed.fastq ../Year_2/2Year_Redo/Sample_${i}/Sample_${i}_R2_trimmed.fastq" >>Year2_BreSeq_${i}
qsub -l walltime=20:00:00,vmem=100gb,nodes=1:ppn=8 ./Year2_BreSeq_${i}
done