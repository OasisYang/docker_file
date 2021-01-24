FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04
  
WORKDIR /workspace

RUN apt update && apt-get update && apt-get install -y \
                build-essential \
                cmake \
                curl \
                g++ \
                wget \
                bzip2 \
                git \
                vim \
                tmux \
                git \
                unzip \
                libosmesa6-dev \
                libgl1-mesa-glx \
                libgtk2.0-dev \
                libglfw3 \
                patchelf \
                libglu1-mesa \
                libxext6 \
                libxtst6 \
                libxrender1 \
                libxi6 && \
    ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/conda/bin:$PATH

RUN curl -o ~/miniconda.sh -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    conda install pytorch torchvision cudatoolkit=11.0 -c pytorch && \
    pip install opencv-python

# # RUN pip install --upgrade pip
# # RUN pip install scipy imageio pyyaml pyssim joblib easydict docopt tqdm pyyaml \
# #                       Pillow scikit-image opencv-python pytube \
# #                       numpy tensorboardX

# # RUN conda install -c menpo ffmpeg
# RUN /opt/conda/envs/mtrl/bin/pip install tensorboardX tabulate && \
#     apt-get update && \
#     apt-get install -y libsm6 libxext6 libxrender-dev && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

