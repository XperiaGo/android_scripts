#! /bin/bash

branch="cm-11.0"
remote="LineageOS"
twrpbranch="android-6.0"
twrpremote="omnirom"
twrpurl="https://github.com/omnirom/android_bootable_recovery.git"
urlstart="https://github.com/LineageOS/android_"
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
hardware/libhardware
hardware/libhardware_legacy
packages/apps/Settings
packages/inputmethods/LatinIME
system/core
system/media
system/vold
vendor/cm
)

#############


# Read array $path lenght
repos=$(echo ${#path[@]} )

read -r -p "Do you wish to add remotes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]; then
  for ((i = 0; i < $repos; i++)); do
    # TWRP exception
    if [[ ${path[i]} == bootable/recovery ]]; then
      echo "Adding remote ${twrpremote} to ${path[i]}"
      git -C ${path[i]} remote remove ${twrpremote}
      git -C ${path[i]} remote add ${twrpremote} ${twrpurl}
    else
      echo "Adding remote ${remote} to ${path[i]}"
      # Generate url from $path
      url="${urlstart}$(echo ${path[i]} | sed 's.\/._.g')${urlend}"
      git -C ${path[i]} remote remove ${remote}
      git -C ${path[i]} remote add ${remote} ${url}
    fi
  done
echo
fi

read -r -p "Do you wish to fetch remotes? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  for ((i = 0; i < $repos; i++)); do
    echo "Fetching ${path[i]}"
    # TWRP exception
    if [[ ${path[i]} == bootable/recovery ]]; then
      git -C ${path[i]} fetch ${twrpremote} ${twrpbranch}
    else
      git -C ${path[i]} fetch ${remote} ${branch}
    fi
  done
echo
fi

read -r -p "Do you wish to change branches? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]; then
  for ((i = 0; i < $repos; i++)); do
# TWRP exception
    if [[ ${path[i]} == bootable/recovery ]]; then
      echo "Changing ${path[i]} branch to $twrpbranch"
      git -C ${path[i]} branch temp
      git -C ${path[i]} checkout temp
      git -C ${path[i]} branch -D $twrpbranch
      git -C ${path[i]} branch $twrpbranch
      git -C ${path[i]} checkout $twrpbranch
      git -C ${path[i]} branch -D temp
    else
      echo "Changing ${path[i]} branch to $branch"
      git -C ${path[i]} branch temp
      git -C ${path[i]} checkout temp
      git -C ${path[i]} branch -D $branch
      git -C ${path[i]} branch $branch
      git -C ${path[i]} checkout $branch
      git -C ${path[i]} branch -D temp
    fi
  done
echo
fi

read -r -p "Do you wish to merge changes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]; then
  for ((i = 0; i < $repos; i++)); do
    echo "Merging changes to ${path[i]}"
    # TWRP exception
    if [[ ${path[i]} == bootable/recovery ]]; then
      git -C ${path[i]} merge ${twrpremote}/${twrpbranch}
    else
      git -C ${path[i]} merge ${remote}/${branch}
    fi
  echo
done
fi

read -r -p "Do you wish to push changes? [y/N] " response
response=${response,,}  
if [[ $response =~ ^(yes|y)$ ]]; then
  #eval `ssh-agent -s`
  #ssh-add
  for ((i = 0; i < $repos; i++)); do
    echo "Pushing ${path[i]} changes"
    git="${gitstart}$(echo ${path[i]} | sed 's.\/._.g')${gitend}"
    # TWRP exception
    if [[ ${path[i]} == bootable/recovery ]]; then
      git -C ${path[i]} push ${git} ${twrpbranch}
    else
      git -C ${path[i]} push ${git} ${branch}
    fi
  done
fi

exit
