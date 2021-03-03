#!/bin/bash

SPECIES=$1

bin/plink --vcf data/vcfs/${SPECIES}_clean.vcf.gz --make-bed --out data/${SPECIES}/${SPECIES} --set-missing-var-ids @:#[$SPECIES]\$1,\$2 --allow-extra-chr
bin/plink --bfile data/${SPECIES}/${SPECIES} --indep-pairwise 50 10 0.1 --out data/${SPECIES}/${SPECIES} --allow-extra-chr
bin/plink --bfile data/${SPECIES}/${SPECIES} --make-bed --extract data/${SPECIES}/${SPECIES}.prune.in --out data/${SPECIES}/${SPECIES}.ld_pruned --allow-extra-chr

