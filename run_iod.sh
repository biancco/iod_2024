#!/bin/bash

# INCREMENTAL STEPS
step=1

task=10-10
name=IOD_LR005_BS2_ALPHA01_BETA05_GAMMA05_random
python tools/train_incremental.py -t ${task} -n ${name} -s ${step} --feat ard -gamma 0.5 --dist_type id -alpha 0.1 -beta 0.5 -mb 2000 -mt random -cvd 1
