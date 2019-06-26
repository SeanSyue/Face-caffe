# Copy necessary files for compiling third-party layers

cp third-party/Sphereface/tools/caffe-sphereface/include/caffe/layers/margin_inner_product_layer.hpp include/caffe/layers
cp third-party/Sphereface/tools/caffe-sphereface/src/caffe/layers/margin_inner_product_layer.cpp src/caffe/layers
cp third-party/Sphereface/tools/caffe-sphereface/src/caffe/layers/margin_inner_product_layer.cu src/caffe/layers

cp third-party/LM-Softmax/include/caffe/layers/largemargin_inner_product_layer.hpp include/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/largemargin_inner_product_layer.cpp src/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/largemargin_inner_product_layer.cu src/caffe/layers

cp third-party/LM-Softmax/include/caffe/layers/bn_layer.hpp include/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/bn_layer.cpp src/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/bn_layer.cu src/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/bn_layer.hpp src/caffe/layers
cp third-party/LM-Softmax/src/caffe/layers/cudnn_bn_layer.hpp src/caffe/layers