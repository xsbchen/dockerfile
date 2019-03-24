## Asuswrt Merlin NG 固件交叉编译环境

[![](https://images.microbadger.com/badges/image/xsbchen/asuswrt-merlin.ng-build.svg)](https://microbadger.com/images/mritd/asuswrt-merlin.ng-build 'Get your own image badge on microbadger.com') [![](https://images.microbadger.com/badges/version/xsbchen/asuswrt-merlin.ng-build.svg)](https://microbadger.com/images/mritd/asuswrt-merlin.ng-build 'Get your own version badge on microbadger.com')

> 本镜像基于 ubuntu 18.04 制作，参考了 `mritd/asuswrt-merlin-build` 镜像(感谢原作者[mritd](https://github.com/mritd))；本镜像默认安装了大部分编译所需依赖包，**但尚未打包 Merlin NG 固件源码(打包后镜像体积 2G)，使用时需要先从 [Merlin NG Release](https://github.com/RMerl/asuswrt-merlin.ng/releases) 下载源码，并挂载到 `/home/asuswrt-merlin.ng` 目录(如不想挂载，镜像内也提供了下载脚本)，编译前请先执行 `/root/build.sh` 初始化相关环境变量(默认已经执行)**

### 1、下载源码

编译能够在 Merlin NG、Tomato 固件上运行的程序之前，需要先获取 Merlin NG 固件源码(需要其交叉编译工具链)，下载地址可从 [Merlin NG Release](https://github.com/RMerl/asuswrt-merlin.ng/releases) 获取

```sh
export ASUSWRT_MERLIN_NG_VERSION=384.10
wget https://github.com/RMerl/asuswrt-merlin.ng/archive/${ASUSWRT_MERLIN_NG_VERSION}.tar.gz
tar -zxf ${ASUSWRT_MERLIN_NG_VERSION}.tar.gz
mv asuswrt-merlin-${ASUSWRT_MERLIN_NG_VERSION} asuswrt-merlin
```

**如果 tar 命令解压出现 `Directory renamed before its status could be extracted` 错误，请安装 `bsdtar` 命令，Ubunut 下执行 `sudo apt-get install -y bsdtar`；然后使用 `bsdtar` 解压，用法同 `tar` 命令**

### 2、运行编译环境

准备好 Merlin NG 源码后，只需要将其挂载到 `/home/asuswrt-merlin.ng` 目录(当然可能你需要同时挂载你要编译程序的源码目录)，并运行容器即可

```
docker run -dt --name build -v /data/asuswrt-merlin.ng:/home/asuswrt-merlin.ng -v /data/curl-7.54.0:/root/curl-7.54.0 xsbchen/asuswrt-merlin.ng-build
```

**`/data/asuswrt-merlin.ng` 为刚刚下载的 Merlin 固件源码目录，`/data/curl-7.54.0` 为要编译的程序源码目录**

### 3、进入容器编译

容器运行后，可以通过 `docker ps` 查看其运行状态，并通过 `docker exec` 命令进入容器

```sh
docker exec -it build bash
```

交叉编译时请确保 C 编译器为 `arm-linux-gcc`，即可以声明变量 `export CC=/home/asuswrt-merlin.ng/release/src-rt-6.x.4708/toolchains/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin/arm-linux-gcc`
