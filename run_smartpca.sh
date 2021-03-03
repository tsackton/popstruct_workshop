#!/bin/bash

SPECIES=$1
PREFIX=${SPECIES}.ld_pruned

#generate a fixed individual file
awk '{print $1,$2,$3,$4,$5,1}' data/${SPECIES}/$PREFIX.fam > data/${SPECIES}/$PREFIX.PCA.fam

echo genotypename: data/${SPECIES}/$PREFIX.bed > data/${SPECIES}/$PREFIX.par
echo snpname: data/${SPECIES}/$PREFIX.bim >> data/${SPECIES}/$PREFIX.par
echo indivname: data/${SPECIES}/$PREFIX.PCA.fam >> data/${SPECIES}/$PREFIX.par
echo snpweightoutname: data/${SPECIES}/$PREFIX.snpeigs >> data/${SPECIES}/$PREFIX.par
echo evecoutname: data/${SPECIES}/$PREFIX.eigs >> data/${SPECIES}/$PREFIX.par
echo evaloutname: data/${SPECIES}/$PREFIX.eval >> data/${SPECIES}/$PREFIX.par
echo phylipoutname: data/${SPECIES}/$PREFIX.fst >> data/${SPECIES}/$PREFIX.par
echo numoutevec: 20 >> data/${SPECIES}/$PREFIX.par
echo numoutlieriter: 0 >> data/${SPECIES}/$PREFIX.par
echo outlieroutname: data/${SPECIES}/$PREFIX.out >> data/${SPECIES}/$PREFIX.par
echo altnormstyle: NO >> data/${SPECIES}/$PREFIX.par
echo missingmode: NO >> data/${SPECIES}/$PREFIX.par
echo nsnpldregress: 0 >> data/${SPECIES}/$PREFIX.par
echo noxdata: YES >> data/${SPECIES}/$PREFIX.par
echo nomalexhet: YES >> data/${SPECIES}/$PREFIX.par

#run smartpca
smartpca -p data/${SPECIES}/$PREFIX.par
