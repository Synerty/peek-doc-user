#!/usr/bin/env bash

PY_PACKAGE="peek_doc_user"
PYPI_PUBLISH="1"

GITHUB_PUSH="${GITHUB_PUSH:-1}"

VER_FILES_TO_COMMIT=""

VER_FILES=""
VER_FILES="${VER_FILES} ${PY_PACKAGE}/conf.py"
