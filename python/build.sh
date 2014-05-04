#!/bin/bash
set -v

# remove previous build
./clean.sh

# build C++ library

mkdir -p ../src/build
pushd ../src/build

qmake ../qhexedit.pro
make

popd

# build python bindings

./setup.py build build_ext --library-dir=../src/build


# test

export PYTHONPATH=$PWD
export LD_LIBRARY_PATH=$PWD/../src/build:$LD_LIBRARY_PATH
./test.py
