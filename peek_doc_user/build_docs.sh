#!/usr/bin/env bash

set -o nounset
set -o errexit

if [ -n "`echo 'false' | bash -l`" ]; then
    echo "ERROR, Your bash setup spits out extra text when it's run"
    exit -1
fi

# Make sure this script has all the environment setup
export PATH="$(dirname `echo 'which python' | bash -l`):$PATH"

path=`dirname $0`
cd $path

ARGS=" $path $path/doc_dist"

echo "Running sphinx-autobuild with args :"
echo "$ARGS"

sphinx-build $ARGS
