# Docker image for Deep Learning and computer vision

This is a setup made to make it fast and simple to setup a new environment for deep learning development.
Enabling GPU-support is as simple as seting a single variable (USE_GPU) to True, which makes it easy
to use this setup on both your local environment, and on a remote workstation or cloud environment.

Packages included:

- Python 3.5
- Tensorflow
- Keras
- Opencv 3
- Numpy
- Matplotlib
- Seaborn

## Usage:

1. Start jupyter notebook instance:
    `make jupyter`
1. Start bash shell:
    `make jupyter`


## Prerequesites:
- docker

If you want to run with GPU-support:
- nvidia-docker
    

