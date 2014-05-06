echo "========================================"
echo "OTA Updater Configuration (for Xperia U)"
echo "========================================"

PS3='Select the device on which you want to configure OTA: '
options=("Xperia U" "Xperia P" "Xperia Sola" "Xperia Go" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Xperia U")
			echo "========================================"
			echo "Xperia U selected !"
			echo "========================================"
            echo "Enter build ID like XperiaSTECM11 for Xperia STE Team (don't use special characters, - _ , spaces, etc... )"
			read buildid
			echo "========================================"
			echo "Enter name of the build (otaupdater.otaver) like Build2 or Pre2Build7 (don't use special characters, - _ , spaces, etc... )"
			read buildname
			echo "========================================"
			echo "Enter date of $buildname like 20140504-1337 (YearMonthDay-HourMinutes)"
			read builddate
			sed -i 's/^\(.*otaupdater.otaid=\).*/\1'"$buildid"'/' device/sony/kumquat/kumquat.mk
			sed -i 's/^\(.*otaupdater.otaver=\).*/\1'"$buildname"'/' device/sony/kumquat/kumquat.mk
			sed -i 's/^\(.*otaupdater.otatime=\).*/\1'"$builddate"'/' device/sony/kumquat/kumquat.mk
			echo "========================================"
			echo "OTA Updated values writed on kumquat.mk:"
			sed -n '/otaupdater.otaid=/p' device/sony/kumquat/kumquat.mk
			sed -n '/otaupdater.otaver=/p' device/sony/kumquat/kumquat.mk
			sed -n '/otaupdater.otatime=/p' device/sony/kumquat/kumquat.mk
			echo "========================================"
			break
            ;;
        "Xperia P")
			echo "========================================"
			echo "Xperia P selected !"
			echo "========================================"
            echo "Enter build ID like XperiaSTECM11 for Xperia STE Team (don't use special characters, - _ , spaces, etc... )"
			read buildid
			echo "========================================"
			echo "Enter name of the build (otaupdater.otaver) like Build2 or Pre2Build7 (don't use special characters, - _ , spaces, etc... )"
			read buildname
			echo "========================================"
			echo "Enter date of $buildname like 20140504-1337 (YearMonthDay-HourMinutes)"
			read builddate
			sed -i 's/^\(.*otaupdater.otaid=\).*/\1'"$buildid"'/' device/sony/nypon/nypon.mk
			sed -i 's/^\(.*otaupdater.otaver=\).*/\1'"$buildname"'/' device/sony/nypon/nypon.mk
			sed -i 's/^\(.*otaupdater.otatime=\).*/\1'"$builddate"'/' device/sony/nypon/nypon.mk
			echo "========================================"
			echo "OTA Updated values writed on nypon.mk:"
			sed -n '/otaupdater.otaid=/p' device/sony/nypon/nypon.mk
			sed -n '/otaupdater.otaver=/p' device/sony/nypon/nypon.mk
			sed -n '/otaupdater.otatime=/p' device/sony/nypon/nypon.mk
			echo "========================================"
			break
            ;;
        "Xperia Sola")
			echo "========================================"
			echo "Xperia Sola selected !"
			echo "========================================"
            echo "Enter build ID like XperiaSTECM11 for Xperia STE Team (don't use special characters, - _ , spaces, etc... )"
			read buildid
			echo "========================================"
			echo "Enter name of the build (otaupdater.otaver) like Build2 or Pre2Build7 (don't use special characters, - _ , spaces, etc... )"
			read buildname
			echo "========================================"
			echo "Enter date of $buildname like 20140504-1337 (YearMonthDay-HourMinutes)"
			read builddate
			sed -i 's/^\(.*otaupdater.otaid=\).*/\1'"$buildid"'/' device/sony/pepper/pepper.mk
			sed -i 's/^\(.*otaupdater.otaver=\).*/\1'"$buildname"'/' device/sony/pepper/pepper.mk
			sed -i 's/^\(.*otaupdater.otatime=\).*/\1'"$builddate"'/' device/sony/pepper/pepper.mk
			echo "========================================"
			echo "OTA Updated values writed on pepper.mk:"
			sed -n '/otaupdater.otaid=/p' device/sony/pepper/pepper.mk
			sed -n '/otaupdater.otaver=/p' device/sony/pepper/pepper.mk
			sed -n '/otaupdater.otatime=/p' device/sony/pepper/pepper.mk
			echo "========================================"
			break
            ;;
        "Xperia Go")
			echo "========================================"
			echo "Xperia Go selected !"
			echo "========================================"            echo "Enter build ID like XperiaSTECM11 for Xperia STE Team (don't use special characters, - _ , spaces, etc... )"
			read buildid
			echo "========================================"
			echo "Enter name of the build (otaupdater.otaver) like Build2 or Pre2Build7 (don't use special characters, - _ , spaces, etc... )"
			read buildname
			echo "========================================"
			echo "Enter date of $buildname like 20140504-1337 (YearMonthDay-HourMinutes)"
			read builddate
			sed -i 's/^\(.*otaupdater.otaid=\).*/\1'"$buildid"'/' device/sony/lotus/lotus.mk
			sed -i 's/^\(.*otaupdater.otaver=\).*/\1'"$buildname"'/' device/sony/lotus/lotus.mk
			sed -i 's/^\(.*otaupdater.otatime=\).*/\1'"$builddate"'/' device/sony/lotus/lotus.mk
			echo "========================================"
			echo "OTA Updated values writed on lotus.mk:"
			sed -n '/otaupdater.otaid=/p' device/sony/lotus/lotus.mk
			sed -n '/otaupdater.otaver=/p' device/sony/lotus/lotus.mk
			sed -n '/otaupdater.otatime=/p' device/sony/lotus/lotus.mk
			echo "========================================"
			break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
