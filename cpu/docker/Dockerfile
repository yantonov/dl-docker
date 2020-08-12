FROM yantonov/anaconda3:2020.07

MAINTAINER Yury Antonov <yantonov@yandex.ru>

RUN /opt/conda/bin/pip install --ignore-installed \
     https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.3.0-cp38-cp38-manylinux2010_x86_64.whl

ADD files/requirements.txt /
RUN pip install -r /requirements.txt

RUN conda clean --packages

# used by keras visualization utilities
RUN apt-get install -y \
    graphviz
