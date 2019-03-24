#!/bin/bash

ASUSWRT_MERLIN_NG_VERSION=384.9

wget -P /tmp https://github.com/RMerl/asuswrt-merlin.ng/archive/${ASUSWRT_MERLIN_NG_VERSION}.tar.gz

bsdtar -zxf /tmp/${ASUSWRT_MERLIN_NG_VERSION}.tar.gz -C /tmp
rm /tmp/${ASUSWRT_MERLIN_NG_VERSION}.tar.gz

mv /tmp/asuswrt-merlin.ng-${ASUSWRT_MERLIN_NG_VERSION} /home/asuswrt-merlin.ng
