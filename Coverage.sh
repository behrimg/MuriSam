#!/bin/bash
grep -v --no-group-separator reject evidence/evidence.gd| grep RA|cut -f 4-5,7-8 > Desc.txt
grep -v --no-group-separator reject evidence/evidence.gd| grep RA|grep -o 'polymorphism_frequency=[ A-Za-z0-9]*\.[ A-Za-z0-9]*...'|cut -d "=" -f 2 > poly.txt
grep -v --no-group-separator reject evidence/evidence.gd| grep RA|grep -o 'total_cov=[ A-Za-z0-9]*\/[ A-Za-z0-9]*'| cut -d "=" -f 2 > total_cov.txt
sed 's/\// /g' total_cov.txt > total_cov_split.txt
cut -d " " -f 1 total_cov_split.txt > PlusStrand.txt
cut -d " " -f 2 total_cov_split.txt > MinusStrand.txt
perl /N/dc2/projects/muri2/Tools/readCoverage.pl

paste Desc.txt poly.txt Coverage.txt > Sample${i}_700D.coverage.txt
rm Desc.txt poly.txt total_cov.txt Coverage.txt total_cov_split.txt PlusStrand.txt MinusStrand.txt
