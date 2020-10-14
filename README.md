# Face-Caffe

### **For more information about the original work of `Caffe`, please visit the official [Caffe repository](https://github.com/BVLC/caffe)**

## Introduction of This Repository
A simple collection of different face recognition implementations that based on `Caffe`. The implementations are gathered in the `third-party` folder. 

### List of Implementations Included in This Repository
* [Sphereface](https://github.com/wy1iu/LargeMargin_Softmax_Loss.git)
* [LM-Softmax](https://github.com/wy1iu/LargeMargin_Softmax_Loss.git)
* [AM-Softmax](https://github.com/happynear/AMSoftmax.git)
* [Normface](https://github.com/happynear/NormFace.git)
* [Center-Loss](https://github.com/ydwen/caffe-face.git)

## Where to Start
The necessary files for building this project is self-contained. Simply follow the [official instruction](https://caffe.berkeleyvision.org/installation.html) and install by yourself. 

## Instruction of Building the Docker Image
Since compiling `docker` images with GPU support is not widely sustained, one should better run the `make` command inside a running container. 

Follow these steps to build your own `docker` image:
1. Create and edit the `Makefile.config` file.
2. Create the `docker` image by running `docker build` command. It will automatically copy all necessary files in the image from your current work directory. 
3. Fire up a container by running `docker run` command. Here, you shouldn't run the command with `--rm` argument because you need to commit the container later. 
4. Inside the `docker` container, build `caffe`.
5. After successfully build `caffe` inside your `docker` container, exit the container and create the image by running `docker commit` command.

For more detail about installing `caffe`, please visit the [official instruction](https://caffe.berkeleyvision.org/installation.html).