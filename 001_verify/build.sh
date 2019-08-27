#!/usr/bin/env bash
rm -rf build
rm -rf 001_verify

mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-D_GLIBCXX_USE_CXX11_ABI=1 -DCMAKE_PREFIX_PATH=/root/libtorch/torch/lib/ ..
make -j4
cd ..

mv build/001_verify .

./001_verify
rm -rf build

