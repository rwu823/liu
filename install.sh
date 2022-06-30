#!/bin/bash

curl -L https://github.com/rwu823/liu/raw/master/src/OpenVanilla%2Bliu.zip -o OpenVanilla_liu.zip &&
unzip ./OpenVanilla_liu.zip &&
mv ./OpenVanilla.app ~/Library/Input\ Methods/ &&

mkdir -p ~/Library/Application\ Support/OpenVanilla/UserData/TableBased &&
mv ./liu7.cin ~/Library/Application\ Support/OpenVanilla/UserData/TableBased/liu7.cin;

echo "Installed... ~/Library/Input Methods/OpenVanilla.app";
echo "Installed... ~/Library/Application Support/OpenVanilla/UserData/TableBased/liu7.cin";

open /System/Library/PreferencePanes/Keyboard.prefPane;

# remove the .zip file
rm ./OpenVanilla_liu.zip;
