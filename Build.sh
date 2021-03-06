#!/bin/bash

CM="lineage-11.0"
VERSION="-$(date -u +%Y%m%d)"
CCASHE=true

# Help
if [[ "$*" == "-"* ]] && [[ "$*" == *"h"* ]]; then
  echo -e "Usage: $0 [OPTION]\n"
  echo -e " -p		Get prebuilts\n -c		Clobber\n -b		Bootimage\n -s             Skip generating manifest"
  exit
fi

# Generate manifest
if [[ "$*" == "-"* ]] && [[ "$*" == *"s"* ]]; then
: # null command
else
	echo -e "\e[32mGenerating manifest $CM$VERSION.xml\e[0m"
	if ! [ -f .repo/manifests_history/$CM$VERSION.xml ]; then

		repo manifest -r -o .repo/manifests_history/$CM$VERSION.xml
	else
                echo -e "\e[31mFile .repo/manifests_history/$CM$VERSION.xml already exists, aborting. \e[0m"
		exit 1
	fi
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

# Get prebuilts
if [[ "$*" == "-"* ]] && [[ "$*" == *"p"* ]] || [ ! -f vendor/cm/proprietary/Term.apk ]; then
  echo "Getting prebuilts..."
  cd vendor/cm && ./get-prebuilts && cd ../..
fi

# Ccache
if [[ "$CCASHE" == "true" ]]; then
  export USE_CCACHE=1
  export CCACHE_DIR=$(realpath ../ccashe)
  prebuilts/misc/linux-x86/ccache/ccache -M 50G
fi

# Version
export CM_BUILDTYPE=RELEASE
export PRODUCT_VERSION_DEVICE_SPECIFIC=$VERSION
export KBUILD_BUILD_USER=HardLight
export KBUILD_BUILD_HOST=BuildDroid

# Build
. build/envsetup.sh
lunch cm_lotus-userdebug
if [[ "$*" == "-"* ]] && [[ "$*" == *"b"* ]]; then
  echo -e "\e[32mBuilding bootimage.\e[0m"
  time make bootimage -j4
else
  echo -e "\e[32mBuilding ROM.\e[0m"
  time make bacon -j4
fi
