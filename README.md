![alt text](http://l.i4g.me/xperiaste_line-xdared.png "Logo")


Instructions for building CM11
---------------------------------

### QuickStart:

    git clone https://github.com/XperiaSTE/android_scripts.git -b stable/cm-11.0 cm-11.0
    cd cm-11.0
    repo init -u git://github.com/CyanogenMod/android -b stable/cm-11.0
    ./Update.sh
    ./CompileROM.sh [ -u / -p / -g / -s ]

### OpenDelta Updater:

For OpenDelta Configurator: ./ODConfig.sh nextversionnumber; 
About the nextversionnumber you need to use future build version, not current build version.
If this build is 14, type 15 (./ODConfig.sh 15;) 

### Credits:
    
* @munjeni: For kernel, having ported Android KitKat to Xperia 2012 devices and bugfixing
* @DevSwift: For developing on Xperia 2012 devices and bugfixing
* @percy-g2: For his support and bugfixing
* @Andrewas: For his stable repositories
* @AOSX: For having ported Android Open Source Project to Xperia 2012
* @XperiaNovathor: For maintaining repos of kumquat
* @Legacy-Xperia: For updated patches and device trees
* @XperiaSTE: Update and maintain CyanogenMod 11 for Xperia 2012
