#!/usr/bin/env sh

# Create symbolic links to the scripts being installed.  This requires figuring 
# out where they these scripts are located on the filesystem, but I can make a 
# pretty good guess by parsing the path in front of $0.  But I also allow the 
# user to manually enter a path.

SCRIPT_PATH=$(readlink -f $0)
EXPECTED_PATH=$(dirname $SCRIPT_PATH)

PROMPT="Please confirm the path to the installation: "
read -p "$PROMPT" -e -i "$EXPECTED_PATH" INSTALL_PATH

ln -nsf $INSTALL_PATH/setup.vim ~/.vimrc
