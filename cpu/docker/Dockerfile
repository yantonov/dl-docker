FROM yantonov/anaconda3:2020.02

MAINTAINER Yury Antonov <yantonov@yandex.ru>

RUN /opt/conda/bin/pip install --ignore-installed \
     https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.3.0-cp37-cp37m-manylinux2010_x86_64.whl

ADD files/conda_requirements.txt /
RUN conda install -y --file /conda_requirements.txt
ADD files/requirements.txt /
RUN pip install -r /requirements.txt

RUN conda clean --packages

# used by keras visualization utilities
RUN apt-get install -y \
    graphviz
