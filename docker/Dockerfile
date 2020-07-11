#FROM nvcr.io/nvidia/tensorrt:19.03-py3
# FROM nvcr.io/nvidia/pytorch:19.07-py3
# FROM nvcr.io/nvidia/pytorch:18.12-py3
#FROM nvcr.io/nvidia/pytorch:19.04-py3
FROM nvcr.io/nvidia/pytorch:20.03-py3
#FROM nvcr.io/nvidia/pytorch:19.10-py3

# https://github.com/freemanix/torchbuilder/blob/master/Dockerfile

RUN apt-get update &&\
    apt-get install -y sudo git bash


ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:/code/cmake-3.14.3-Linux-x86_64/bin:${PATH}
ENV PYTHONPATH=/opt/conda/lib/python3.7/site-packages/:$PYTHONPATH
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/lib/:/opt/conda/lib/python3.7

RUN apt-get update \
 && apt-get install -y \
    build-essential git gfortran \
    cmake curl wget unzip libreadline-dev libjpeg-dev libpng-dev ncurses-dev \
    imagemagick gnuplot gnuplot-x11 libssl-dev libzmq3-dev graphviz

RUN ls -la /opt/conda/lib

# Install CMake 3.14

#ARG CMAKE=cmake-3.14.1.tar.gz
#RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.1/${CMAKE}
#RUN tar xvzf ${CMAKE} && cd cmake* && ./bootstrap --parallel=$(nproc)
#RUN cd cmake* && make -j$(nproc) && make install


RUN conda install -c anaconda python=3.7.4
RUN find / -name conda

# PyTorch
# RUN pip install -U torch torchvision
#RUN conda install -y pytorch torchvision pandas scikit-image cython cudatoolkit=10.0 -c pytorch
#RUN conda install -y   pandas scikit-image cython -c pytorch
RUN pip install -U  spacy

# Basic images processing
RUN pip install -U imageio 

#OpenCV CUDA
ENV OPENCV_VERSION 4.1.0
# ENV OPENCV_VERSION 4.1.0
RUN apt-get install yasm

RUN apt-get update && apt-get -y install autoconf automake build-essential libass-dev libtool  pkg-config texinfo zlib1g-dev cmake mercurial libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev  libxvidcore-dev libx264-dev libx265-dev libnuma-dev libatlas-base-dev libopus-dev libvpx-dev gfortran unzip
# RUN git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
# RUN cd nv-codec-headers && make && make install


WORKDIR "/root/"

# RUN conda uninstall -y torch torchvision
#RUN conda uninstall -y libtiff

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/lib/python3.6

WORKDIR "/root/"
# ABI=0 is really important

RUN conda config --add channels conda-forge
#RUN conda install -c conda-forge 
# RUN conda install opencv
RUN conda install -c conda-forge ffmpeg x264
RUN conda install x264=='1!152.20180717' ffmpeg=4.0.2 -c conda-forge
RUN conda install -c conda-forge opencv visdom 


WORKDIR "/root/"
# Jupyter
RUN pip --no-cache-dir install pandas jupyter ipywidgets sklearn matplotlib  ipython  ipykernel

# Set working dir
RUN mkdir -p /root/.jupyter/

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN python3 -m pip install ipykernel
RUN python3 -m ipykernel install --user
RUN python3 -m ipykernel.kernelspec
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/
COPY run_jupyter.sh /root/

WORKDIR "/root/"
RUN chmod +x run_jupyter.sh

# Visualization
RUN pip install -U graphviz hiddenlayer nvidia-ml-py3 seaborn


# Augmentation and preprocessing
RUN pip install -U albumentations
# RUN pip install git+https://github.com/pytorch/contrib.git
RUN pip install -U texttable

RUN pip install -U psutil

# Apex
RUN pip install -U pip
# RUN git clone https://github.com/NVIDIA/apex apex_build
# RUN cd apex_build && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

RUN pip install pysoundfile librosa  sonopy editdistance sentencepiece
RUN pip install easydict Cython h5py lmdb mahotas pandas requests bs4 matplotlib lxml
RUN pip install youtube-dl==2019.4.17  bcolz graphviz imutils

RUN pip install -U pillow #-i https://pypi.tuna.tsinghua.edu.cn/simple/
RUN pip install flask_socketio eventlet 
ENV NO_SQLITE=1
RUN pip install pretrainedmodels bottle paste flask sanic Sanic-Cors
RUN pip install sklearn_pandas isoweek pandas_summary  
RUN pip install flasgger flask-restplus Flask-SQLAlchemy rstr jsonpickle flask_dropzone flask_cors mtcnn pycocotools  pytesseract gtts imutils
RUN pip install SQLAlchemy flask_sqlalchemy shapely

ENV NVIDIA_VISIBLE_DEVICES all

RUN apt-get update \
    && apt-get install -y openssh-server xauth \
    && mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && ssh-keygen -A \
    && sed -i "s/^.*ClientAliveInterval.*$/ClientAliveInterval 120/" /etc/ssh/sshd_config \
    && sed -i "s/^.*ClientAliveCountMax.*$/ClientAliveCountMax 720/" /etc/ssh/sshd_config \
    && sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
 
RUN pip install path.py

WORKDIR /root/
RUN conda install faiss-gpu -c pytorch

RUN ldconfig
RUN pip install tqdm sklearn pandas scipy flask --disable-pip-version-check

# for tf conda remove wrapt
RUN conda update wrapt
RUN pip install tensorflow-gpu==1.15 keras --disable-pip-version-check


RUN conda install xeus-cling -c QuantStack -c conda-forge
RUN conda install faiss-gpu -c pytorch

RUN pip install tornado==5.0.0

RUN git clone https://github.com/pdollar/coco.git && cd coco/PythonAPI && make install && pip3 install -e .
#RUN pip install --upgrade gensim nltk numpy torch torchvision tqdm Pillow scikit-image
RUN pip install --upgrade gensim nltk numpy tqdm Pillow scikit-image

#RUN python3 -m nltk.downloader stopwords


RUN apt-get -y install libopenmpi-dev
RUN apt-get -y install openmpi-bin
RUN apt-get -y install libblacs-mpi-dev
RUN pip install horovod
RUN conda install -c anaconda nccl
RUN pip install starlette aiofiles uvicorn aiohttp librosa  

RUN echo "ssh-rsa" >> /root/.ssh/authorized_keys

RUN echo 'ldconfig'  >> /root/.bashrc
# RUN source /root/.bashrc

RUN echo "export PATH=$PATH" >> /etc/profile && \
    echo "ldconfig" >> /etc/profile

# TRT 7
#ENV os=ubuntu1804
#RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/${os}/x86_64/nvidia-machine-learning-repo-${os}_1.0.0-1_amd64.deb -P /root/TensorRT/.
#RUN dpkg -i /root/TensorRT/nvidia-machine-learning-repo-${os}_1.0.0-1_amd64.deb
#RUN apt-get update
#RUN apt-get install -y libnvinfer7 libnvonnxparsers7 libnvparsers7 libnvinfer-plugin7
#RUN apt-get install -y libnvinfer-dev libnvonnxparsers-dev libnvparsers-dev libnvinfer-plugin-dev
#RUN apt-get install -y python-libnvinfer-dev


EXPOSE 6006 3838 8787 8888 8786 9786 8788 5432 8000 7800 9999 7842 22 3122 7847 7848 8097 27017
RUN conda install notebook ipykernel
RUN ipython kernel install --user

pip install jupytext
