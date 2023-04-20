#!/bin/bash

detect_os() {
  grep -qis "$*" /etc/issue || grep -qis "$*" /etc/centos-release
}

do_update() {
  echo "Detecting OS ... "

  detect_os "Debian GNU/Linux" && echo "Found Debian" && dpkg_update && return
  detect_os "Ubuntu" && echo "Found Ubuntu" && dpkg_update && return
  detect_os "CentOS" && echo "Found CenOS" && yum_update && return
  detect_os "Red Hat" && echo "Found RedHat" && yum_update && return
  detect_os "Fedora" && echo "Found Fedora" && yum_update && return
  detect_os "SUSE" && echo "Found SuSE" && zypper_update && return
}

dpkg_update() {
 if [ -x "/usr/bin/apt-get" ];
 then
   echo "Starting update ..."
   apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
 else
   echo "'apt-get' package manager not found"
 fi
}

yum_update() {
 if [ -x "/usr/bin/yum" ];
 then
   echo "Starting update ..."
   yum update -y && yum upgrade -y
 else
   echo "'yum' package manager not found"
 fi
}

zypper_update() {
 if [ -x "/usr/bin/zypper" ];
 then
   echo "Starting update ..."
   zypper --non-interactive update
 else
   echo "'zypper' package manager not found"
 fi
}

do_update
