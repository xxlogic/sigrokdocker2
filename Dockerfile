FROM ubuntu:20.04
RUN mkdir -p /WORK
WORKDIR /WORK

RUN apt update   && \
  apt  install -y --no-install-recommends\
    software-properties-common \
    lsb-release dirmngr  gpg-agent bash  nsis  doxygen rubygems

RUN	gem install asciidoctor-pdf	
RUN apt-key adv \
    --keyserver keyserver.ubuntu.com \
    --recv-keys 86B72ED9 
	
RUN add-apt-repository \
    "deb [arch=amd64] https://pkg.mxe.cc/repos/apt `lsb_release -sc` main" 
	
RUN apt  update && \
 /bin/bash -c "apt  -y  install  mxe-x86-64-w64-mingw32.static-{gcc,glib,libzip,libusb1,libftdi1,hidapi,glibmm,qtbase,qtimageformats,qtsvg,qttranslations,boost,check,gendef,libieee1284}" && \ 
 rm -fr /var/lib/apt/lists/
  
