#!/bin/bash

SPECIES=$1

vcftools --gzvcf data/vcfs/${SPECIES}.chrom9.vcf.gz --out data/${SPECIES}/${SPECIES} --remove-indels --remove-filtered-all --missing-indv
vcftools --gzvcf data/vcfs/${SPECIES}.chrom9.vcf.gz --out data/${SPECIES}/${SPECIES} --remove-indels --remove-filtered-all --depth
vcftools --gzvcf data/vcfs/${SPECIES}.chrom9.vcf.gz --out data/${SPECIES}/${SPECIES} --remove-indels --remove-filtered-all --max-missing 0.15 --relatedness2
