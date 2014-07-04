#Get prebuilts
echo "Getting prebuilts..."
cd vendor/cm && ./get-prebuilts && cd ../..
#Compile
if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    # Use local Java Development Kit 6
    if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
       echo "Using local JDK 6..."
       export JAVA_HOME=$(realpath ../jdk1.6.0_45);
    fi
    case $1 in
    -u)
      lunch cm_kumquat-eng && make otapackage -j8;
    ;;
    -ru)
      lunch cm_kumquat-userdebug && make otapackage -j8;
    ;;
    -p)
      lunch cm_nypon-eng && make otapackage -j8;
    ;;
    -rp)
      lunch cm_nypon-userdebug && make otapackage -j8;
    ;;
    -s)
      lunch cm_pepper-eng && make otapackage -j8;
    ;;
    -rs)
      lunch cm_pepper-userdebug && make otapackage -j8;
    ;;
    -g)
      lunch cm_lotus-eng && make otapackage -j8;
    ;;
    -rg)
      lunch cm_lotus-userdebug && make otapackage -j8;
    ;;
    *)
      echo "ERROR: Unknow option";
      exit -1;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
    exit -1;
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./CompileROM.sh -u | -p | -s | -g | -ru | -rp | -rs | -rg"
  exit -1;
fi
