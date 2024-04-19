#!/bin/bash

python update.py $1

# check system and move files to correct location

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on macOS"
    mkdir -p "$HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1"
    mkdir -p "$HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1/template"
    if [ ! -d "$HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1" ]; then
        echo "Failed to create directory"
        exit 1
    fi

    if [ -f modernpro-coverletter.typ ] && [ -f typst.toml ]; then
        cp -r modernpro-coverletter.typ typst.toml "$HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1"
        cp -r template/* "$HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1/template"
        echo "Successfully copied files to $HOME/Library/Application Support/typst/packages/local/modernpro-coverletter/$1"
    else
        echo "One or more files do not exist in the current directory."
        exit 1
    fi

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Running on Linux"

    mkdir -p "$HOME/.local/share/typst/packages/local/modernpro-coverletter/$1"
    mkdir -p "$HOME/.local/share/typst/packages/local/modernpro-coverletter/$1/template"
    if [ ! -d "$HOME/.local/share/typst/packages/local/modernpro-coverletter/$1" ]; then
        echo "Failed to create directory"
        exit 1
    fi

    if [ -f modernpro-coverletter.typ ] && [ -f typst.toml ]; then
        cp -r modernpro-coverletter.typ typst.toml "$HOME/.local/share/typst/packages/local/modernpro-coverletter/$1"
        cp -r template/* "$HOME/.local/share/typst/packages/local/modernpro-coverletter/$1/template"
        echo "Successfully copied files to $HOME/.local/share/typst/packages/local/modernpro-coverletter/$1"
    else
        echo "One or more files do not exist in the current directory."
        exit 1
    fi

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # %APPDATA%
    echo "Running on Windows"

    mkdir -p "$APPDATA/typst/packages/local/modernpro-coverletter/$1"
    mkdir -p "$APPDATA/typst/packages/local/modernpro-coverletter/$1/template"

    if [ ! -d "$APPDATA/typst/packages/local/modernpro-coverletter/$1" ]; then
        echo "Failed to create directory"
        exit 1
    fi

    if [ -f modernpro-coverletter.typ ] && [ -f typst.toml ]; then
        cp -r modernpro-coverletter.typ typst.toml "$APPDATA/typst/packages/local/modernpro-coverletter/$1"
        cp -r template/* "$APPDATA/typst/packages/local/modernpro-coverletter/$1/template"

        echo "Successfully copied files to $APPDATA/typst/packages/local/modernpro-coverletter/$1"
    else
        echo "One or more files do not exist in the current directory."
        exit 1
    fi

fi




git add .
git commit -m "Update version to $1"
git tag -a $1 -m "$1"
git push origin $1
