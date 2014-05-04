echo "========================="
echo "OTA Updater Configuration"
echo "========================="
echo "Enter build ID like XperiaSTEAOSX for Xperia STE Team (don't use special characters, - _ , spaces, etc... )"
read buildid
echo "========================="
echo "Enter name of the build (otaupdater.otaver) like Build2 or Pre2Build7 (don't use special characters, - _ , spaces, etc... )"
read buildname
echo "========================="
echo "Enter date of $buildname like 20140504-1337 (YearMonthDay-HourMinutes)"
read builddate
sed -i 's/^\(    otaupdater.otaid=\).*/\1'"$buildid"'/' device/sony/kumquat/kumquat.mk
sed -i 's/^\(    otaupdater.otaver=\).*/\1'"$buildname"'/' device/sony/kumquat/kumquat.mk
sed -i 's/^\(    otaupdater.otatime=\).*/\1'"$builddate"'/' device/sony/kumquat/kumquat.mk
echo "========================="
echo "OTA Updated values writed on kumquat.mk:"
sed -n '/otaupdater.otaid=/p' device/sony/kumquat/kumquat.mk
sed -n '/otaupdater.otaver=/p' device/sony/kumquat/kumquat.mk
sed -n '/otaupdater.otatime=/p' device/sony/kumquat/kumquat.mk
echo "========================="
