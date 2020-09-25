#!/usr/bin/env Rscript

# ########################################################

pdf("figs.pdf")

#d1 = read.csv("24-08-2020.csv",na.strings=c("."))
d1 = read.csv("24-08-2020.csv")

d2 = read.csv("24-08-2020.csv",colClasses="character",na.strings="?")
times = as.difftime(d2$Total.time, "%H:%M:%S")

print("Total")
print(times)
print(sum(times))

name_unique = unique(d1$Name)
n = length(name_unique)

for (k in 4:4){

   a = d1[d1$Name == name_unique[k], ]
   print(a)

   
}

# dev.off()
print("Graphics constructed with success!")
