#!/bin/bash

# cd test
rm -rf pics

#a=$(ls -1 |wc -l)
#a=1
#for i in $(seq 1 $a)
#do
#  echo $i
#done

for file in $(ls | grep "\.pdf$")
do
  echo $file
#  pdftk summer-school-talk-io.pdf cat 1 output summer-school-talk-io-1.pdf
  pdftk $file cat 1 output ${file%%.pdf}-1.pdf
done

mkdir pics
mv *-1.pdf pics

cd pics

for file in $(ls | grep "\.pdf$")
do
  echo $file
#  pdftocairo convert all pages to png
#  pdftocairo -png mypage.pdf mypage.png
#  pdftocairo -png $file ${file%%.pdf}.png
  pdftocairo -png $file ${file%%-1.pdf}
done

mkdir png
mv *-1.png png

cd png

for file in $(ls | grep "\.png$")
do
  echo $file
  mv $file ${file%%-1.png}.png
done

