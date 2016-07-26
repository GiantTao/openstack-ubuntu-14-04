#!/bin/bash

# set 查看当前shell的变量 env 所有的环境变量 export 查看导出的环境变量
set -e  # -e：若有一条指令执行失败则立即退出
set +o xtrace # 关闭trace输出

#---------------------------------------------
# Set up Env.
#---------------------------------------------

TOPDIR=$(cd $(dirname "$0") && pwd) # TOPDIR 当前脚本所在的目录
source $TOPDIR/localrc  # 导出当前目录下的localrc中的变量
source $TOPDIR/tools/function # 导入tools下的function中的变量
TEMP=`mktemp`; 
rm -rfv $TEMP >/dev/null; 
mkdir -p $TEMP;

#---------------------------------------------
# source localrc
#---------------------------------------------

set_password RABBITMQ_PASSWORD

apt-get install -y --force-yes rabbitmq-server
rabbitmqctl change_password guest $RABBITMQ_PASSWORD

set -o xtrace # 打开trace输出
