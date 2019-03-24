#!/bin/bash
fun_set_text_color(){
    COLOR_RED='\E[1;31m'
    COLOR_GREEN='\E[1;32m'
    COLOR_YELOW='\E[1;33m'
    COLOR_BLUE='\E[1;34m'
    COLOR_PINK='\E[1;35m'
    COLOR_PINKBACK_WHITEFONT='\033[45;37m'
    COLOR_GREEN_LIGHTNING='\033[32m \033[05m'
    COLOR_END='\E[0m'
}

main(){
    echo -e "${COLOR_YELOW}============== Initialized build environment ==============${COLOR_END}"

    if [ ! -d "/home/asuswrt-merlin.ng" ]; then
        echo -e "${COLOR_RED}/home/asuswrt-merlin.ng/ not found${COLOR_END}"
        return 1
    fi
    
    echo -e -n "${COLOR_PINK}Downloading toolchains...${COLOR_END}"
    if [ ! -d "~/am-toolchains" ]; then
        wget -P /tmp https://github.com/RMerl/am-toolchains/archive/master.tar.gz
        bsdtar -zxf /tmp/master.tar.gz -C /tmp
        mv /tmp/am-toolchains-master ~/am-toolchains
        rm -rf /tmp/master.tar.gz
        echo -e " ${COLOR_GREEN}done${COLOR_END}"
    else
        echo -e " ${COLOR_YELOW}ignore${COLOR_END}"
    fi

    echo -e -n "${COLOR_PINK}Linking toolchains...${COLOR_END}"
    ln -sf ~/am-toolchains/brcm-arm-hnd /opt/toolchains
    ln -sf bash /bin/sh

    mkdir -p /media/ASUSWRT/
    ln -s /home/asuswrt-merlin.ng /media/ASUSWRT/asuswrt-merlin.ng

    if [ ! -f "/opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib/libmpc.so.2" ]; then
        ln -s /opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib/libmpc.so.3.0.0 /opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib/libmpc.so.2
    fi
    echo -e " ${COLOR_GREEN}done${COLOR_END}"

    echo -e -n "${COLOR_PINK}Setup Environment...${COLOR_END}"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib
    export TOOLCHAIN_BASE=/opt/toolchains
    export PATH=$PATH:/opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin
    export PATH=$PATH:/opt/toolchains/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin
    echo -e " ${COLOR_GREEN}done${COLOR_END}"
    #echo "$PATH"
}

fun_set_text_color
main
