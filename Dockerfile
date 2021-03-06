# Base image
FROM gcr.io/tensorflow/tensorflow:latest-py3

# Installing ubuntu packages
RUN  apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libhdf5-dev \
        libpq-dev \
        libxext-dev \
        libsm6 \
        libxrender1 \
        libfontconfig1
        
RUN pip3 install --no-cache-dir \
    keras \
    opencv-contrib-python \
    seaborn \
    watermark 

WORKDIR /app

# Setting up volumes
VOLUME ["/app"]

# TensorBoard
RUN mkdir /logs/
EXPOSE 6006

# jupyter
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='deep-cv'
CMD tensorboard --logdir=/logs/
