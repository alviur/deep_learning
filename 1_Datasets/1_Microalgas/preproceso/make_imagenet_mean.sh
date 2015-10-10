#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=/home/lex/2_SISTEMIC/1_Proyecto_Microalgas/1_Algorithms/2_Caffe
DATA=/home/lex/2_SISTEMIC/1_Proyecto_Microalgas/1_Algorithms/2_Caffe
TOOLS=/home/lex/caffe-master/build/tools

$TOOLS/compute_image_mean $EXAMPLE/microalgas_train_lmdb \
  $DATA/imagenet_mean.binaryproto

echo "Done."
