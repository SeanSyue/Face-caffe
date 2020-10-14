FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
LABEL version="1.0"
LABEL description="Docker runtime environment for Face-caffe project"

# Install system-wide dependencies
ARG TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        graphviz \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        libssl-dev \
        protobuf-compiler \
        python3-dev \
        python3-pip \
        python3-setuptools && \
    rm -rf /var/lib/apt/lists/*

# Copy files from your work directory 
# and set environment variables inside the image
COPY . /opt/caffe
ENV CAFFE_ROOT=/opt/caffe
ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH

# Install Python 3 dependencies
WORKDIR $PYCAFFE_ROOT
RUN python3 -m pip install --upgrade pip && \
    for req in $(cat requirements.txt) pydot; \
    do python3 -m pip install $req --use-feature=2020-resolver; \
    done

# Compile caffe.proto
WORKDIR $CAFFE_ROOT
RUN protoc src/caffe/proto/caffe.proto --cpp_out=. && \
    mkdir include/caffe/proto && \
    mv src/caffe/proto/caffe.pb.h include/caffe/proto

# After building the image, create a container and continue building caffe
# See instructions on: https://caffe.berkeleyvision.org/installation.html
