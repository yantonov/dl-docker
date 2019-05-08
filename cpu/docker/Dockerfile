FROM yantonov/anaconda3

MAINTAINER Yury Antonov <yantonov@yandex.ru>

# Downgrade to python 3.6
RUN conda install python=3.6.6

RUN pip install --ignore-installed --upgrade \
     https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.13.1-cp36-cp36m-linux_x86_64.whl

ADD files/conda_requirements.txt /
RUN conda install -y --file /conda_requirements.txt
ADD files/requirements.txt /
RUN pip install -r /requirements.txt

USER root

# used by keras visualization utilities
RUN apt-get install -y \
    graphviz

USER ${MY_USER}

RUN conda clean --packages
