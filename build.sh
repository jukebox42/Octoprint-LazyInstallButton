#!usr/bin/env bash

# bash build.sh YYYY.M.D

echo "=== Building LazyInstallButton ===";
echo "";

# Take inputs
dt=`date +"%y.%-m.%-d"alpha`;
echo "Settings:";
version="${1:-$dt}";
debug="${2:-y}";
echo "- Version: $version";
echo ""

# Delete and recreate the build directory
rm -rf Octoprint-LazyInstallButton
rm -rf Octoprint-LazyInstallButton.zip
mkdir Octoprint-LazyInstallButton

# Copy files ans folders we need in the build
cp -r extras Octoprint-LazyInstallButton/extras # this is empty so copy wont move it
cp -r octoprint_lazyinstallbutton Octoprint-LazyInstallButton/octoprint_lazyinstallbutton
cp -r translations Octoprint-LazyInstallButton/translations
cp babel.cfg Octoprint-LazyInstallButton/babel.cfg
cp LICENSE.txt Octoprint-LazyInstallButton/LICENSE.txt
cp MANIFEST.in Octoprint-LazyInstallButton/MANIFEST.in
cp requirements.txt Octoprint-LazyInstallButton/requirements.txt
cp setup.py Octoprint-LazyInstallButton/setup.py

# Rewrite version
echo -n "Writing plugin version... "
sed -i "s/plugin_version = \"VERSION\"/plugin_version = \"$version\"/" Octoprint-LazyInstallButton/setup.py
echo "done"

# Compress the build directory
echo -n "Zipping... ";
zip -q -r Octoprint-LazyInstallButton.zip Octoprint-LazyInstallButton
rm -rf Octoprint-LazyInstallButton
echo "done";

echo "Done.";