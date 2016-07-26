#!/bin/bash

# set 查看当前shell的变量 env 所有的环境变量 export 查看导出的环境变量
set -e  # -e：若指令传回值不等于0，则立即退出shell。
set +o xtrace

#---------------------------------------------
# Set up Env.
#---------------------------------------------

TOPDIR=$(cd $(dirname "$0") && pwd)
source $TOPDIR/localrc
source $TOPDIR/tools/function
TEMP=`mktemp`; rm -rfv $TEMP >/dev/null; mkdir -p $TEMP;

#---------------------------------------------
# source localrc
#---------------------------------------------

set_password RABBITMQ_PASSWORD

apt-get install -y --force-yes rabbitmq-server
rabbitmqctl change_password guest $RABBITMQ_PASSWORD

set -o xtrace
