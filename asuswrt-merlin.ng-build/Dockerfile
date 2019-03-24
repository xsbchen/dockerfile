FROM ubuntu:18.04 

LABEL maintainer="xsbchen <xsbchen@users.noreply.github.com>"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Asuswrt Merlin NG Build" \
      org.label-schema.description="Asuswrt Merlin NG 固件交叉编译环境" \
      org.label-schema.url="https://xschen.com" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/xsbchen/dockerfile/tree/master/asuswrt-merlin.ng-build" \
      org.label-schema.vendor="xsbchen" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

COPY build.sh /root/build.sh

COPY download_merlin.sh /root/download_merlin.sh

RUN dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y \
        wget bsdtar libtool-bin cmake libproxy-dev uuid-dev liblzo2-dev autoconf automake bash bison \
        bzip2 diffutils file flex m4 g++ gawk groff-base libncurses-dev libtool libslang2 make patch perl pkg-config shtool \
        subversion tar texinfo zlib1g zlib1g-dev git-core gettext libexpat1-dev libssl-dev cvs gperf unzip \
        python libxml-parser-perl gcc-multilib gconf-editor libxml2-dev g++-multilib gitk libncurses5 mtd-utils \
        libncurses5-dev libvorbis-dev git autopoint autogen sed build-essential intltool libelf1:i386 libglib2.0-dev \
        xutils-dev lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && echo ". ~/build.sh" >> /root/.bashrc

CMD ["bash"]
