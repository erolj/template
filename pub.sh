#!/bin/bash
#
# npm package publish

DATEFMT=$(date "+%d-%m-%Y %I:%M:%S")

newL() {
    printf "\n"
}
semver() {
  echo "»  Choose version."
  select yn in "Major" "Minor" "Patch"; do
    case $yn in
      Major )
        npm version major;
        break;;
      Minor )
        npm version minor;
        break;;
      Patch )
        npm version patch;
        exit;;
    esac
  done
}

echo "i  Publishing package to NPM registry..."
newL && semver
newL && npm publish
newL && echo "✔  Selesai. ($DATEFMT)"
newL