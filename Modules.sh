#Make modules
if [[ $# = 1 ]]; then
  cd kernel/sony/u8500
  export ARCH=arm
  export CROSS_COMPILE=/home/devhub/cm11/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi-
  if [[ $? = 0 ]]; then
    case $1 in
    -u)
      make mrproper
      make xperiau_defconfig
      make modules
      cd ../../..
      mkdir -p out/target/product/kumquat/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*.ko out/target/product/kumquat/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
      cd kernel/sony/u8500
      make mrproper
    ;;
    -p)
      make mrproper
      make xperiap_defconfig
      make modules
      cd ../../..
      mkdir -p out/target/product/nypon/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*.ko out/target/product/nypon/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*.ko out/target/product/nypon/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*.ko out/target/product/nypon/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*/*.ko out/target/product/nypon/system/lib/modules/
      cd kernel/sony/u8500
      make mrproper
    ;;
    -s)
      make mrproper
      make xperiasola_defconfig
      make modules
      cd ../../..
      mkdir -p out/target/product/pepper/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*.ko out/target/product/pepper/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*.ko out/target/product/pepper/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*.ko out/target/product/pepper/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*/*.ko out/target/product/pepper/system/lib/modules/
      cd kernel/sony/u8500
      make mrproper
    ;;
    -g)
      make mrproper
      make xperiago_defconfig
      make modules
      cd ../../..
      mkdir -p out/target/product/lotus/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*.ko out/target/product/lotus/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*.ko out/target/product/lotus/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*.ko out/target/product/lotus/system/lib/modules/
      cp -fr kernel/sony/u8500/*/*/*/*/*/*.ko out/target/product/lotus/system/lib/modules/
      cd kernel/sony/u8500
      make mrproper
    ;;
    *)
      echo "ERROR: Unknow option";
      exit -1;
    ;;
    esac
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./Modules.sh -u | -p | -s | -g"
  exit -1;
fi

