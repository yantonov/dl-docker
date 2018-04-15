Scripts to simplify use of keras through docker image.

Docker directory contains scripts to build, run, get terminal access, remove constructed image.

Usage:
Add this repository to PATH and use keras.sh.
Current working directory will be mounted automatically.

Docker file provides:
1. [python 3](https://www.python.org/download/releases/3.0/)
2. [anaconda](https://anaconda.org/anaconda/python) 3.4.1 full installation
3. [jupiter](http://jupyter.org/)
4. [tensorflow](https://www.tensorflow.org) 1.7 with cpu support
5. [keras](https://github.com/keras-team/keras) 2.1.5
