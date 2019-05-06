FROM yantonov/anaconda3

MAINTAINER Yury Antonov <yantonov@yandex.ru>

# Downgrade to python 3.6
RUN conda install python=3.6.6

RUN pip install --upgrade pip && \
    conda update conda -y

# line below is needed to install catboost, jupiterlab
RUN conda config --add channels conda-forge
RUN conda update -c conda-forge conda

# install
RUN pip install --ignore-installed --upgrade \
     https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.13.1-cp36-cp36m-linux_x86_64.whl

# Install python packages and keras
ADD conda_requirements.txt /
RUN conda install -y --file conda_requirements.txt
ADD requirements.txt /
RUN bin/pip install -r requirements.txt

RUN conda clean --packages

ENV JUPITER_PORT 8888
RUN jupyter notebook --generate-config

# jupiter configuration
RUN echo "c.NotebookApp.ip = '*'"               >> /home/${MY_USER}/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = ${JUPITER_PORT}" >> /home/${MY_USER}/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.token = ''"             >> /home/${MY_USER}/.jupyter/jupyter_notebook_config.py
