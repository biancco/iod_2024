#!/bin/bash
GPU=0

# INCREMENTAL STEPS
step=1

task=10-10
name=IOD_LR005_BS4_ALPHA01_BETA05_GAMMA1
exp -t ${task} -n ${name} -s ${step} --feat ard -gamma 1.0 --uce --dist_type id -alpha 0.1 -beta 0.5 -mb 2000 -mt random -cvd ${GPU} -lr 0.005 -bs 4