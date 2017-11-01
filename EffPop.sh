#!/bin/bash
cut -f 2 ../90_day/BreSeq/Sample${i}_90/output/Sample${i}_90D.coverage.txt > 90dayPos.txt
cut -f 2 ../200_day/BreSeq/Sample${i}_200/output/Sample${i}_200D.coverage.txt > 200dayPos.txt
cut -f 2 ../300_day/BreSeq/Sample${i}_300/output/Sample${i}_300D.coverage.txt > 300dayPos.txt
cut -f 2 ../400_day/BreSeq/Sample${i}_400/output/Sample${i}_400D.coverage.txt > 400dayPos.txt
cut -f 2 ../500_day/BreSeq/Sample${i}_500/output/Sample${i}_500D.coverage.txt > 500dayPos.txt
cut -f 2 ../600_day/BreSeq/Sample${i}_600/output/Sample${i}_600D.coverage.txt > 600dayPos.txt
cut -f 2 ../700_day/BreSeq/Sample${i}_700/output/Sample${i}_700D.coverage.txt > 700dayPos.txt

cat *Pos.txt|sort|uniq > Sample${i}_MutPositions.txt

rm *Pos.txt

perl expression.pl Sample${i}_MutPositions.txt ../90_day/BreSeq/Sample${i}_90/output/Sample${i}_90D.coverage.txt > 90RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../200_day/BreSeq/Sample${i}_200/output/Sample${i}_200D.coverage.txt > 200RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../300_day/BreSeq/Sample${i}_300/output/Sample${i}_300D.coverage.txt > 300RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../400_day/BreSeq/Sample${i}_400/output/Sample${i}_400D.coverage.txt > 400RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../500_day/BreSeq/Sample${i}_500/output/Sample${i}_500D.coverage.txt > 500RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../600_day/BreSeq/Sample${i}_600/output/Sample${i}_600D.coverage.txt > 600RawMut.txt
perl expression.pl Sample${i}_MutPositions.txt ../700_day/BreSeq/Sample${i}_700/output/Sample${i}_700D.coverage.txt > 700RawMut.txt

sed 's/^$/.\t.\t.\t.\t.\t./' 90RawMut.txt > 90Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 200RawMut.txt > 200Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 300RawMut.txt > 300Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 400RawMut.txt > 400Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 500RawMut.txt > 500Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 600RawMut.txt > 600Mut.txt
sed 's/^$/.\t.\t.\t.\t.\t./' 700RawMut.txt > 700Mut.txt

paste Sample${i}_MutPositions.txt 90Mut.txt 200Mut.txt 300Mut.txt 400Mut.txt 500Mut.txt 600Mut.txt 700Mut.txt > Sample${i}_MutFiles.txt

cut -f 1,4-7,10-13,16-19,22-25,28-31,34-37,40-43 Sample${i}_MutFiles.txt > Sample${i}_PrePop.txt

cat Header.txt Sample${i}_PrePop.txt > Sample${i}_EffPop.txt

rm *Mut.txt

rm Sample${i}_MutFiles.txt Sample${i}_PrePop.txt Sample${i}_MutPositions.txt
exit
