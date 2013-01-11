#! /bin/bash

path_to_submodule=""
if [ $# -ne 1 ]
then
    echo "$0 (submodule path)"
    exit
else
    path_to_submodule=$1
fi

echo $path_to_submodule

git config -f .git/config --remove-section submodule.$path_to_submodule
git config -f .gitmodules --remove-section submodule.$path_to_submodule

git rm --cached $path_to_submodule

git add .gitmodules

rm -rf $path_to_submodule

rm -rf .git/modules/$path_to_submodule
