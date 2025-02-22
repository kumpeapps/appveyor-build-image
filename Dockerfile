ARG BASE_IMAGE=appveyor/build-image:minimal-ubuntu-20.04
FROM $BASE_IMAGE

RUN apt-get -y update && apt-get install -y wget build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev ; exit 0
RUN wget -c https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tar.xz
RUN tar -Jxf Python-3.11.0.tar.xz
RUN cd Python-3.11.0/ && ./configure --enable-optimizations && make -j4 && sudo make altinstall

USER appveyor

CMD [ "/bin/bash", "/scripts/entrypoint.sh" ]