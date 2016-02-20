android_scripts
===============

Helpful scripts for build CM12.1

QuickStart:

    git clone https://github.com/XperiaSTE/android_scripts.git -b cm-12.1 xste;
    cd xste;
    repo init -u git://github.com/CyanogenMod/android -b cm-12.1;
    ./Update.sh;
    ./ODConfig.sh;
    ./CompileROM.sh -u; (Xperia U)
    ./CompileROM.sh -p; (Xperia P)   
    ./CompileROM.sh -s; (Xperia Sola)
    ./CompileROM.sh -g; (Xperia Go) 

OpenDelta Updater:

	For OpenDelta Configurator: ./ODConfig.sh versionnumber; 
	About the versionnumber you need to use current build version.
	If you want to make the build 14 type 14 (./ODConfig.sh 14;) 

Credits:
    
    @munjeni: Kernel, porting Android Kitkat to Xperia 2012 devices and bugfix
    @DevSwift: Develop on Xperia 2012 devices and bugfix
    @percy-g2: Support and bugfix
    @Andrewas: Stable repository mantainer and support
    @AOSX: Port Android Open Source Project to Xperia 2012
    @CyanogenMod: For CM-12.1
    @XperiaNovathor: For maintaining repos of kumquat
    @Legacy-Xperia: For updated patches and device trees
    @XperiaSTE: Update and maintain CyanogenMod 11,CyanogenMod 12 and CyanogenMod 12.1 for Xperia 2012
    @HubDroid: For build server and OpenDelta system
