#!/usr/bin/env bash

set -o nounset
set -o errexit

path=`dirname $0`
$path/build_docs.sh --watch