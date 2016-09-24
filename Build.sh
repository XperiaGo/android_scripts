#Get prebuilts
echo "Getting prebuilts..."
cd vendor/cm && ./get-prebuilts && cd ../..

# Version 
VERSION="-build1"
export CM_BUILDTYPE=RELEASE
export PRODUCT_VERSION_DEVICE_SPECIFIC=$VERSION
export KBUILD_BUILD_USER=HardLight
export KBUILD_BUILD_HOST=BuildDroid

# Use local Java Development Kit 6
if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
  echo "Trying to use local JDK 6..."
  export JAVA_HOME=$(realpath ../jdk1.6.0_45)
  export PATH=$JAVA_HOME/bin:$PATH	
  if (( $(java -version 2>&1 | grep version | cut -f2 -d".") == 6 )); then
     echo "Using local JDK 6..."
  else
    echo "Could not use local JDK 6. Exiting..."
    exit -1
  fi  	 
 fi

#Compile
. build/envsetup.sh
lunch cm_lotus-userdebug
time make bacon -j4
