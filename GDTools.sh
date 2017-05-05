#!/bin/bash

#$ -q rcc-30d

# SamMuri_SamplingIntervals

date
cd /N/dc2/projects/muri2/task1/BreSeq
AR=(<Sample Names>)

for i in "${AR[@]}"
do

mv ../6_month/BreSeq/Sample${i}_6_month/output/output.gd  ../6_month/BreSeq/Sample${i}_6_month/output/Sample${i}_6_month.gd
mv ../Year1/BreSeq/Sample${i}_Year1/output/output.gd  ../Year1_day/BreSeq/Sample${i}_Year1/output/Sample${i}_Year1.gd
mv ../Year1_5/BreSeq/Sample${i}_Year1_5/output/output.gd  ../Year1_5_day/BreSeq/Sample${i}_Year1_5/output/Sample${i}_Year1_5.gd
mv ../Year2/BreSeq/Sample${i}_Year2/output/output.gd  ../Year2_day/BreSeq/Sample${i}_Year2/output/Sample${i}_Year2.gd
mv ../Year2_5/BreSeq/Sample${i}_Year2_5/output/output.gd  ../Year2_5_day/BreSeq/Sample${i}_Year2_5/output/Sample${i}_Year2_5.gd


gdtools COMPARE -f GD -r ../../SamMuri/Breseq/Ecoli.seq.gb -o Sample${i}.gd ../6_month/BreSeq/Sample${i}_6_month/output/Sample${i}_6_month.gd ../Year1_day/BreSeq/Sample${i}_Year1/output/Sample${i}_Year1.gd ../Year1_5_day/BreSeq/Sample${i}_Year1_5/output/Sample${i}_Year1_5.gd ../Year2_day/BreSeq/Sample${i}_Year2/output/Sample${i}_Year2.gd ../500_day/BreSeq/Sample${i}_Year2_5/output/Sample${i}_Year2_5.gd

gdtools COMPARE -f HTML -r ../../SamMuri/Breseq/Ecoli.seq.gb -o Sample${i}.html ../6_month_day/BreSeq/Sample${i}_6_month/output/Sample${i}_6_month.gd ../Year1_day/BreSeq/Sample${i}_Year1/output/Sample${i}_Year1.gd ../Year1_5_day/BreSeq/Sample${i}_Year1_5/output/Sample${i}_Year1_5.gd ../Year2_day/BreSeq/Sample${i}_Year2/output/Sample${i}_Year2.gd ../Year2_5_day/BreSeq/Sample${i}_Year2_5/output/Sample${i}_Year2_5.gd

gdtools GD2VCF -r ../../SamMuri/Breseq/Ecoli.seq.gb -o Sample${i}.vcf Sample${i}.gd

mkdir Sample${i}_Results

mv Sample${i}* Sample${i}_Results

done