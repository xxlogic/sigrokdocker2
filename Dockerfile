FROM ubuntu:latest
RUN mkdir -p /WORK
WORKDIR /WORK
RUN apt update   
# MXE Requirements
RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libgl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    python3 \
    python3-mako \
    python3-pkg-resources \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils \
    nsis   \
    doxygen  
RUN    gem install asciidoctor-pdf    
RUN      rm -rf /var/lib/apt/lists/*     
WORKDIR /work
RUN    git clone --depth 1 https://github.com/mxe/mxe.git 
RUN   ln -s /usr/bin/python3 /usr/bin/python
RUN   make -C mxe  MXE_TARGETS=x86_64-w64-mingw32.static.posix \
   MXE_PLUGIN_DIRS=plugins/examples/qt5-freeze \
   gcc glib libzip libusb1 libftdi1 hidapi glibmm qtbase qtimageformats \
   qtsvg qttranslations boost check gendef libieee1284 \
   qtbase_CONFIGURE_OPTS='-no-sql-mysql'
RUN rm -f rm -fr mxe/pkg 
RUN rm -fr mxe/.ccache
RUN rm -fr mxe/log*/
RUN rm -fr mxe/pkg
RUN rm -fr mxe/tmp-*
RUN rm -fr mxe/.ccache  
