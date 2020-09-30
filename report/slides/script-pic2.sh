#!/bin/bash

for file in $(ls | grep "\.pdf$")
do
  echo $file
  mv $file ${file%%-1.pdf}.pdf
done

