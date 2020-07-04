#!/bin/bash

PKGZIP="OpenVanilla+liu.zip"
DIRTBL=$HOME/Library/Application\ Support/OpenVanilla/UserData/TableBased
PATHAPP=$HOME/Library/Input\ Methods/OpenVanilla.app
PATHTBL="$DIRTBL/liu7.cin"

if [ ! -s "$PKGZIP" ]; then
    curl -LO "https://github.com/rwu823/liu/raw/master/src/$PKGZIP"
fi
if [ ! -s "$PKGZIP" ]; then
    echo "Sorry, we cannot download $PKGZIP"
    exit 1
fi
if [ -d "$PATHAPP" ]; then
    echo "We'd need to uninstall the original OpenVanilla"
    rm -fr "$PATHAPP"
    if [ $? -ne 0 ]; then
        echo "Cannot remove OpenVanilla successfully"
        exit 1
    fi
    rm -f "$PATHTBL"
fi

mkdir -p $DIRTBL

rm -fr OpenVanillaInstaller.app liu7.cin
unzip OpenVanilla+liu.zip
if [ $? -ne 0 ]; then
    echo "Failed to unzip"
    exit 2
fi
open ./OpenVanillaInstaller.app
if [ $? -ne 0 ]; then
    echo "Failed to Install OpenVanilla"
    exit 3
fi
mv ./liu7.cin "$PATHTBL"
if [ $? -ne 0 ]; then
    echo "Failed to Install Liu Table"
    exit 4
fi
if [ -s "$PATHTBL" ]; then
    echo "OpenVanilla Installed"
    echo "liu7.cin Installed"
    open /System/Library/PreferencePanes/Keyboard.prefPane
    rm -f "$PKGZIP"
else
    echo "Sorry, but there is something wrong"
fi


