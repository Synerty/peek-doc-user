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

pwd


function modPath() {
python <<EOPY
import os.path as p
import $1
dir = p.dirname($1.__file__)
# Convert it to bash if required
if dir[1] == ':':
    dir = '/' + dir[0] + dir[2:].replace('\\\\', '/')
print(dir)
EOPY
}

ARGS=" . ./dist-build/doc_autobuild"

for x in `cat $path/plugin_api_list.txt`
do
    ARGS="$ARGS `modPath $x`"
done

echo "Running sphinx-autobuild with args :"
echo "$ARGS"

# Run the command
if [ "--watch" == "${1-}" ]; then
    ARGS="$ARGS -H 0.0.0.0"
    ARGS="$ARGS -p 8020"
    sphinx-autobuild --watch $ARGS
else
    sphinx-build $ARGS
fi

