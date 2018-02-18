FROM ubuntu
MAINTAINER quentin.mcgaw@gmail.com

ARG var
ENV var=${var}

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y unzip curl nasm:i386 build-essential gcc-multilib g++-multilib

# nasm:i386 build-essential might be useless
RUN mkdir /home/server
WORKDIR /home/server
RUN useradd server && chown -R server:server /home/server
COPY script.sh ./
RUN chmod +x script.sh
ENTRYPOINT ["/home/server/script.sh"]

VOLUME ["/home/cod4/main"]
VOLUME ["/home/cod4/zone"]
VOLUME ["/home/cod4/mods"]
VOLUME ["/home/cod4/usermaps"]
