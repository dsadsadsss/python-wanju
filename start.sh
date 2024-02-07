#!/bin/bash

# 为了更好的隐蔽，建议开启原游戏，节点可在list.log中查看或手搓节点,默认端口vless:8002，vmess:8001
#=======================================
# 设置固定隧道参数(如果不设置，默认启用临时隧道，端口自动，无需手动设置)
# json或token,支持直接复制全部，如cloudflared.exe service install eyxxx，F大佬json获取地址https://fscarmen.cloudflare.now.cc
export TOK='' 
export ARGO_DOMAIN=''
#=======================================
#设置哪吒参数(NEZHA_TLS='1'开启tls,设置其他关闭tls)
export NEZHA_SERVER=''
export NEZHA_KEY=''
export NEZHA_PORT='443'
export NEZHA_TLS='1'
#=======================================
# 下面设置UUID和路径，CF_IP是优选IP，SUB_NAME为节点名称
export UUID='fd80f56e-93f3-4c85-b2a8-c77216c509a7'
export VPATH='vls' #vless路径
export MPATH='vms' #vmess路径
export CF_IP='ip.sb'
export SUB_NAME='bbn'
#=======================================
# 启动玩具原程序，把原游戏文件改名senver.jar,默认不开启，如果开启请去掉前面的#号.
# 注意原游戏启动后，不显示节点日志
# export JAR_SH='java -Xms128M -XX:MaxRAMPercentage=95.0 -jar senver.jar' #复制原启动命令填入并修改启动文件名为senver.jar
#=======================================
# 设置是否显示日志，默认显示，填no不显示，yes显示
# export RIZHI='no'
#=======================================

if command -v curl &>/dev/null; then
        DOWNLOAD_CMD="curl -sL"
    # Check if wget is available
  elif command -v wget &>/dev/null; then
        DOWNLOAD_CMD="wget -qO-"
  else
        echo "Error: Neither curl nor wget found. Please install one of them."
        sleep 30
        exit 1
fi

arch=$(uname -m)
if [[ $arch == "x86_64" ]]; then
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-amd > /tmp/app
else
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-arm > /tmp/app
fi

chmod 777 /tmp/app && /tmp/app 
