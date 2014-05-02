#!/bin/bash
set -v

# remove previous build
rm -rf ../src/build

# build in separate directory
mkdir -p ../src/build
pushd ../src/build

qmake ../qhexedit.pro
make

popd

# generate files
python configure.py

# compile
make

# test
export PYTHONPATH=$PWD
export LD_LIBRARY_PATH=$PWD/../src/build:$LD_LIBRARY_PATH
#../test.py
python -c "import QHexEdit"
