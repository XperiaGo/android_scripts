#! /bin/bash

branch="cm-11.0"
remote="CyanogenMod"
urlstart="https://github.com/CyanogenMod/android_"
urlend=".git"
gitstart="git@github.com:XperiaGo/android_"
#gitstart="https://github.com/XperiaGo/android_"
gitend=".git"

path=(
art
bionic
bootable/recovery
build
external/valgrind
frameworks/av
frameworks/base
frameworks/native
frameworks/opt/telephony
hardware/libhardware
hardware/libhardware_legacy
packages/apps/Settings
packages/inputmethods/LatinIME
system/core
system/media
system/vold
external/koush/Superuser
vendor/cm
)

#############


# Read array $path lenght
repos=$(echo ${#path[@]} )

read -r -p "Do you wish to add remotes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]
then
for ((i = 0; i < $repos; i++)) 
do
echo "Adding remote ${remote} to ${path[i]}"
# Exception
if [[ ${path[i]} == bootable/recovery ]]; then
url="https://github.com/omnirom/android_bootable_recovery.git"
remote="omnirom"
elif [[ ${path[i]} == external/koush/Superuser ]]; then
url="https://github.com/CyanogenMod/Superuser.git"
remote="CyanogenMod"
else
# Generate url from $path
url="${urlstart}$(echo ${path[i]} | sed 's.\/._.g')${urlend}"
remote="CyanogenMod"
fi
git -C ${path[i]} remote remove ${remote}
git -C ${path[i]} remote add ${remote} ${url}
done
echo
fi

read -r -p "Do you wish to fetch remotes? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]
then
for ((i = 0; i < $repos; i++)) 
do
echo "Fetching ${path[i]}"
# Exception
if [[ ${path[i]} == bootable/recovery ]]; then
remote="omnirom"
fi
git -C ${path[i]} fetch ${remote} 
remote="CyanogenMod"
done
echo
fi

read -r -p "Do you wish to change branches? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]
then
for ((i = 0; i < $repos; i++)) 
do
# Exception
if [[ ${path[i]} == bootable/recovery ]]; then
branch="android-7.0"
else
branch="cm-11.0"
fi
echo "Changing ${path[i]} branch  to $branch"
git -C ${path[i]} branch temp
git -C ${path[i]} checkout temp
git -C ${path[i]} branch -D $branch
git -C ${path[i]} branch $branch
git -C ${path[i]} checkout $branch
git -C ${path[i]} branch -D temp
done
echo
fi

read -r -p "Do you wish to merge changes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]
then
for ((i = 0; i < $repos; i++)) 
do
echo "Merging changes to ${path[i]}"
# Exception
if [[ ${path[i]} == bootable/recovery ]]; then
remote="omnirom"
branch="android-7.0"
else
remote="CyanogenMod"
branch="cm-11.0"
fi
git -C ${path[i]} merge ${remote}/${branch}
echo
done
fi

read -r -p "Do you wish to push changes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]
then

#eval `ssh-agent -s`
#ssh-add

for ((i = 0; i < $repos; i++)) 
do
# Exception
if [[ ${path[i]} == bootable/recovery ]]; then
branch="android-7.0"
else
branch="cm-11.0"
fi
echo "Pushing ${path[i]} changes"
# Exception
if [[ ${path[i]} == external/koush/Superuser ]]; then
git="git@github.com:XperiaGo/Superuser.git"
else
git="${gitstart}$(echo ${path[i]} | sed 's.\/._.g')${gitend}"
fi
git -C ${path[i]} push ${git} ${branch}
done
fi

exit

