#!/bin/bash
# Usage:
# ./code/sphereface_train.sh GPU
#
# Example:
# ./code/sphereface_train.sh 0,1,2,3

GPU_ID=$1
./../../build/tools/caffe train -solver lm_solver.prototxt -gpu ${GPU_ID} 2>&1 | tee result/lm_train.log
