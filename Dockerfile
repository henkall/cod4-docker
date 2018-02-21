FROM ubuntu
MAINTAINER quentin.mcgaw@gmail.com

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y nano unzip curl nasm:i386 build-essential gcc-multilib g++-multilib

# nasm:i386 build-essential might be useless
RUN mkdir /home/server
WORKDIR /home/server
RUN useradd server && chown -R server:server /home/server
COPY script.sh ./
RUN chmod +x script.sh
ENTRYPOINT ["/home/server/script.sh"]

VOLUME ["/home/server/main"]
VOLUME ["/home/server/zone"]
VOLUME ["/home/server/mods"]
VOLUME ["/home/server/usermaps"]
