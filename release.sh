#!/bin/bash

git add .
git commit -m "Update version to $1"
git tag -a $1 -m $1
git push origin $1
