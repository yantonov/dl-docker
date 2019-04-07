FROM continuumio/anaconda3

MAINTAINER Yury Antonov <yantonov@yandex.ru>

RUN /opt/conda/bin/pip install --upgrade pip && \
    /opt/conda/bin/conda update conda -y

# line below is needed to install catboost, jupiterlab
RUN /opt/conda/bin/conda config --add channels conda-forge

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

# Install tensorflow
# Downgrade to python 3.6
RUN /opt/conda/bin/conda install python=3.6.6
# install
RUN /opt/conda/bin/pip install --ignore-installed --upgrade \
     https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.13.1-cp36-cp36m-linux_x86_64.whl

# Install python packages and keras
ADD conda_requirements.txt /
RUN /opt/conda/bin/conda install -y --file conda_requirements.txt
ADD requirements.txt /
RUN /opt/conda/bin/pip install -r requirements.txt

ENV R_USER keras
ENV R_UID 1000

RUN useradd -m -s /bin/bash -N -u $R_UID $R_USER && \
    chown $R_USER $CONDA_DIR -R && \
    mkdir -p /src && \
    chown $R_USER /src

USER $R_USER

ENV JUPITER_PORT 8888
RUN jupyter notebook --generate-config

# jupiter configuration
RUN echo "c.NotebookApp.ip = '*'"               >> /home/$R_USER/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = ${JUPITER_PORT}" >> /home/$R_USER/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.token = ''"             >> /home/$R_USER/.jupyter/jupyter_notebook_config.py

EXPOSE $JUPITER_PORT
