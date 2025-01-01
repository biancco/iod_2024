#!/bin/bash
GPU=1
CUDA_VISIBLE_DEVICES=0

# Joint-Training for all data
python tools/train_first_step.py -c configs/voc/e2e_faster_rcnn_R_50_C4_4x_JT.yaml -cvd ${CUDA_VISIBLE_DEVICES}