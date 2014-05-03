#Compile
. build/envsetup.sh
# Use local Java Development Kit 6
if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
  echo "Using local JDK 6..."
  export JAVA_HOME=$(realpath ../jdk1.6.0_45);
fi
lunch lunch cm_kumquat-userdebug && make otapackage -j12;