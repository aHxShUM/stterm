FROM debian:stretch

ENV ST_VERSION 0.8.1

VOLUME ["/output"]

RUN apt-get update && apt-get install -y \
    libx11-dev libxft-dev libxext-dev \
    make gcc git curl

RUN git clone git://git.suckless.org/st /stterm \
  && cd /stterm \
  && git checkout -b ${ST_VERSION} \
  && sed -i -e 's@/usr/X11R6/include@/usr/include/X11@g' config.mk \
  && sed -i -e 's@/usr/X11R6/lib@/usr/lib/X11@g' config.mk

WORKDIR /stterm

ADD install.sh /install.sh

CMD ["sh", "-c", "/install.sh"]
