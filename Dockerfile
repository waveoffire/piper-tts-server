FROM nvcr.io/nvidia/pytorch:22.03-py3

ENV TZ=Europe/Warsaw
ARG DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
COPY . /app
RUN apt-get update


RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.10 curl
RUN apt-get install -y python3.10-distutils
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

RUN ls
RUN python3.10 -m pip install -r requirements.txt
RUN python3.10 -m pip install -r requirements_gpu.txt
RUN python3.10 -m pip install -r requirements_http.txt
CMD [ "python3.10", "-m", "piper.http_server", "--model", "pl_PL-mc_speech-medium.onnx", "--cuda"]
