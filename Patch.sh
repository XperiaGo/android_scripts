#Set patches directory
rootDir=$PWD
patchDir="hardware/semc/patches"

#Patch
echo "Patching..."
for f in $(ls $patchDir | grep .patch);
do
  git apply -p1 --verbose --ignore-space-change --ignore-whitespace < $dir$f
  RETVAL=$?
  if [ $RETVAL -ne 0 ]; then
  echo "Error $RETVAL with patch $dir$f"
  exit -1
  fi
done