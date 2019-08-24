# DarkTorch

A docker for pytorch C++ frontend and OpenCV, trying to get cv::imread() to work. 

## What problem am I trying to resolve:
Libtorch binaries can be installed are build with _GLIBCXX_USE_CXX11_ABI = 0 which make it incompatible for OpenCV.  
Even when compiled with _GLIBCXX_USE_CXX11_ABI = 1, cv::imread() does not work. 

https://github.com/pytorch/pytorch/issues/17492

https://kezunlin.me/post/54e7a3d8/
https://www.jianshu.com/p/6fe9214431c6
https://qiita.com/nmatsui/items/1f6daee53669976f9bd0
https://michhar.github.io/how-i-built-pytorch-gpu/
http://ddrv.cn/a/316670/

## More info

Torch has now two versions:
Download here (Pre-cxx11 ABI): 
https://download.pytorch.org/libtorch/cu100/libtorch-shared-with-deps-1.2.0.zip

Download here (cxx11 ABI): 
https://download.pytorch.org/libtorch/cu100/libtorch-cxx11-abi-shared-with-deps-1.2.0.zip

But whatever i do, I still can not get cv::imread() to work. 
