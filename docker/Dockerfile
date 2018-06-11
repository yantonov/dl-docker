FROM continuumio/anaconda3

MAINTAINER Yury Antonov <yantonov@yandex.ru>

RUN /opt/conda/bin/pip install --upgrade pip && \
    /opt/conda/bin/conda update conda -y && \
    /opt/conda/bin/conda install jupyter -y

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

# install tensorflow
RUN /opt/conda/bin/pip install --ignore-installed --upgrade \
    https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.8.0-cp36-cp36m-linux_x86_64.whl

# Install Python packages and keras
ENV NB_USER keras
ENV NB_UID 1000

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    chown $NB_USER $CONDA_DIR -R && \
    mkdir -p /src && \
    chown $NB_USER /src

USER $NB_USER

RUN /opt/conda/bin/pip install keras

EXPOSE 8888

CMD /opt/conda/bin/jupyter notebook --port=8888 --ip='*' --no-browser --notebook-dir=/src
