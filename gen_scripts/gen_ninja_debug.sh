#!/bin/bash

# Set PhantasyTestbed main directory as working directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

# Delete old build directory and create new one
rm -rf build_ninja_debug
mkdir build_ninja_debug
cd build_ninja_debug

# Generate build files
cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Debug

# Create resources symlink
ln -s ../resources resources