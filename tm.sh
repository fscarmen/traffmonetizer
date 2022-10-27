#!/bin/bash

# 定义容器名前缀
NAME='tm_'

# 自定义字体彩色，read 函数，安装依赖函数
red(){ echo -e "\033[31m\033[01m$1$2\033[0m"; }
green(){ echo -e "\033[32m\033[01m$1$2\033[0m"; }
yellow(){ echo -e "\033[33m\033[01m$1$2\033[0m"; }
reading(){ read -rp "$(green "$1")" "$2"; }

# 必须以root运行脚本
check_root(){
  [[ $(id -u) != 0 ]] && red " The script must be run as root, you can enter sudo -i and then download and run again." && exit 1
}

# 判断系统，并选择相应的指令集
check_operating_system(){
  CMD=("$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)"
       "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)"
       "$(lsb_release -sd 2>/dev/null)" "$(grep -i description /etc/lsb-release 2>/dev/null | cut -d \" -f2)"
       "$(grep . /etc/redhat-release 2>/dev/null)"
       "$(grep . /etc/issue 2>/dev/null | cut -d \\ -f1 | sed '/^[ ]*$/d')"
      )

  for i in "${CMD[@]}"; do SYS="$i" && [[ -n $SYS ]] && break; done

  REGEX=("debian" "ubuntu" "centos|red hat|kernel|oracle linux|amazon linux|alma|rocky")
  RELEASE=("Debian" "Ubuntu" "CentOS")
  PACKAGE_UPDATE=("apt -y update" "apt -y update" "yum -y update")
  PACKAGE_INSTALL=("apt -y install" "apt -y install" "yum -y install")
  PACKAGE_UNINSTALL=("apt -y autoremove" "apt -y autoremove" "yum -y autoremove")

  for ((int = 0; int < ${#REGEX[@]}; int++)); do
    [[ $(echo "$SYS" | tr '[:upper:]' '[:lower:]') =~ ${REGEX[int]} ]] && SYSTEM="${RELEASE[int]}" && break
  done

  [[ -z $SYSTEM ]] && red " ERROR: The script supports Debian, Ubuntu, CentOS or Alpine systems only.\n" && exit 1
}

# 判断宿主机的 IPv4 或双栈情况,没有拉取不了 docker
check_ipv4(){
  ! curl -s4m8 ip.sb | grep -q '\.' && red " ERROR：The host must have IPv4. " && exit 1
}

# 判断 CPU 架构
check_virt(){
  ARCHITECTURE=$(uname -m)
  case "$ARCHITECTURE" in
    aarch64 ) ARCH=arm64v8;;
    x64|x86_64|amd64 ) ARCH=latest;;
    * ) red " ERROR: Unsupported architecture: $ARCHITECTURE\n" && exit 1;;
  esac
}

# 寻找已有的容器名中编号的最大值，从该值的下一个开始建
check_exist(){
  if [ $(type -p docker) ]; then
    NUM_ALL=$(docker ps -a | awk '{print $NF}' | grep -E "$NAME" | sed "s/[^0-9]*//")
    j=1
    while true; do
      k="\$$j"
      NUM_NOW=$(echo $NUM_ALL | awk "{print $k}")
      [[ $NUM_MAX -lt $NUM_NOW ]] && NUM_MAX="$NUM_NOW"
      [ -z $NUM_NOW ] && break
      (( j++ )) || true
    done
  fi
  CONTAIN_NAME=$NAME$(( NUM_MAX + 1 ))
  
  # 输入 traffmonetizer 的个人 token
  [ -z $TMTOKEN ] && reading " Enter your token, something end with =, if you do not find it, open https://traffmonetizer.com/?aff=196148: " TMTOKEN
}

container_build(){
  # 宿主机安装 docker
  if ! systemctl is-active docker >/dev/null 2>&1; then
  yellow "\n Install docker"
    if [ $SYSTEM = "CentOS" ]; then
      ${PACKAGE_INSTALL[int]} yum-utils
      yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      ${PACKAGE_INSTALL[int]} docker-ce docker-ce-cli containerd.io
      systemctl enable --now docker
    else
      ${PACKAGE_INSTALL[int]} docker.io
    fi
  fi
  # 创建容器
  yellow "\n Create the traffmonetizer container.\n " && docker run -d --name $CONTAIN_NAME traffmonetizer/cli:$ARCH start accept --token "$TMTOKEN" >/dev/null 2>&1
}

# 安装 watchtower ，以实时同步官方最新镜像
towerwatch_build(){
  [[ ! $(docker ps -a) =~ 'watchtower' ]] && yellow " Install Watchtower.\n " && docker run -d --name watchtower --restart always  -p 2095:8080 -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup >/dev/null 2>&1
}

# 显示结果
result(){
  docker ps -a | grep -q "$NAME" && docker ps -a | grep -q "watchtower" && green " Install success.\n" || red " install fail.\n"
}

# 卸载
uninstall(){
  docker rm -f $(docker ps -a | grep -E "$NAME" | awk '{print $1}')
  docker rmi -f $(docker images | grep traffmonetizer/cli | awk '{print $3}')
  green "\n Uninstall containers and images complete.\n"
  exit 0
}

# 传参
while getopts "UuT:t:" OPTNAME; do
  case "$OPTNAME" in
    'U'|'u' ) uninstall;;
    'T'|'t' ) TMTOKEN=$OPTARG;;
  esac
done

# 主程序
check_root
check_operating_system
check_ipv4
check_virt
check_exist
container_build
towerwatch_build
result

