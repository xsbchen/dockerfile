#!/bin/bash

ASUSWRT_MERLIN_NG_VERSION=384.9

wget https://github.com/RMerl/asuswrt-merlin.ng/archive/${ASUSWRT_MERLIN_NG_VERSION}.tar.gz

bsdtar -zxf ${ASUSWRT_MERLIN_NG_VERSION}.tar.gz
rm ${ASUSWRT_MERLIN_NG_VERSION}.tar.gz

mv asuswrt-merlin.ng-${ASUSWRT_MERLIN_NG_VERSION} /home/asuswrt-merlin.ng
