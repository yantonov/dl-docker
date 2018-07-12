Scripts are aimed to simplify using keras (with cpu support) through docker image.

Docker directory contains scripts to build, run, get terminal access, remove constructed image.

Usage:
Add this repository to PATH and use keras.sh.
Current directory will be mounted automatically.

Docker file provides:
1. [python 3](https://www.python.org/download/releases/3.0/)
2. [anaconda](https://anaconda.org/anaconda/python) 5.2.0
3. [jupiter](http://jupyter.org/)
4. [tensorflow](https://www.tensorflow.org) 1.8 with cpu support
5. [keras](https://github.com/keras-team/keras) 2.2

Links:
[https://hub.docker.com/r/yantonov/dl-cpu/](hub.docker.com/r/yantonov/dl-cpu)
