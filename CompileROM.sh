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
      lunch cm_kumquat-eng && make -j8 otapackage;
    ;;
    -ru)
      lunch cm_kumquat-user && export DISABLE_DEXPREOPT=true && export WITH_DEXPREOPT=false && make -j8 otapackage;
    ;;
    -p)
      lunch cm_nypon-eng && make -j8 otapackage;
    ;;
    -rp)
      lunch cm_nypon-user && export DISABLE_DEXPREOPT=true && export WITH_DEXPREOPT=false && make -j8 otapackage;
    ;;
    -s)
      lunch cm_pepper-eng && make -j8 otapackage;
    ;;
    -rs)
      lunch cm_pepper-user && export DISABLE_DEXPREOPT=true && export WITH_DEXPREOPT=false && make -j8 otapackage;
    ;;
    -g)
      lunch cm_lotus-eng && make -j8 otapackage;
    ;;
    -rg)
      lunch cm_lotus-user && export DISABLE_DEXPREOPT=true && export WITH_DEXPREOPT=false && make -j8 otapackage;
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
