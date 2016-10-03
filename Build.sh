#!/bin/bash

VERSION="-$(date -u +%Y%m%d)"
CCASHE=true

# Help
if [[ "$*" == "-"* ]] && [[ "$*" == *"h"* ]]; then
  echo -e "Usage: $0 [OPTION]\n"
  echo -e " -p		Get prebuilts\n -c		Clobber\n -b		Bootimage"
  exit
fi

# Use local Java Development Kit 6
if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
  export JAVA_HOME=$(realpath ../jdk1.6.0_45)
  export PATH=$JAVA_HOME/bin:$PATH
  if (( $(java -version 2>&1 | grep version | cut -f2 -d".") == 6 )); then
    echo -e "\e[32mUsing local JDK 6.\e[0m"
  else
    echo -e "\e[31mCould not use local JDK 6. Exiting.\e[0m"
    exit -1
  fi
 fi

# Clobber
if [[ "$*" == "-"* ]] && [[ "$*" == *"c"* ]]; then
  make clobber
fi

#Get prebuilts
if [[ "$*" == "-"* ]] && [[ "$*" == *"p"* ]]; then
  echo "Getting prebuilts..."
  cd vendor/cm && ./get-prebuilts && cd ../..
fi

# Ccache
if [[ "$CCASHE" == "true" ]]; then
  export USE_CCACHE=1
  export CCACHE_DIR=/srv/ccache/cm11.0/
  prebuilts/misc/linux-x86/ccache/ccache -M 30G
fi

# Version
export CM_BUILDTYPE=RELEASE
export PRODUCT_VERSION_DEVICE_SPECIFIC=$VERSION
export KBUILD_BUILD_USER=HardLight
export KBUILD_BUILD_HOST=BuildDroid

#Compile
. build/envsetup.sh
lunch cm_lotus-userdebug
if [[ "$*" == "-"* ]] && [[ "$*" == *"b"* ]]; then
  echo -e "\e[32mBuilding bootimage.\e[0m"
  time make bootimage -j4
else
  echo -e "\e[32mBuilding ROM.\e[0m"
  time make bacon -j4
fi
