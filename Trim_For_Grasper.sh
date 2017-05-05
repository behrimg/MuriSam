#!/bin/bash

cd /N/dc2/projects/muri2/SamMuri/Clones/113/Grasper

java -jar /N/dc2/projects/muri2/Tools/Trimmomatic-0.32/trimmomatic-0.32.jar PE -threads 4 -phred33 ../Sample1/Sample_113_1_R1.fastq ../Sample1/Sample_113_1_R2.fastq 113_1_1.trimmo.fq 113_1_1.trimmo.fq.singleton  113_1_2.trimmo.fq 113_1_2.trimmo.fq.singleton CROP:90 MINLEN:70 &> Sample113_1_trimstat
