# DarkTorch
A low-latency deep learning inference server using pytorch C++ frontend.

(A demo of running inference on a PyTorch Resnet34 CNN model using a tqdm like callback)
![resnet34](resnet34.gif)

# Introduction
![darktorch logo](darktorch-logo.jpg)

This repository implements a low-latency deep learning inference server using pytorch C++ frontend & NVIDIA GPUs. 
The DarkTorch service is a C++ application running a HTTP server with a REST API. This service is able to run inference on multiple deep learning models in parallel on all the available GPU processors to obtain the results in the shortest time possible. 

`torch::jit::script::Module module = torch::jit::load(s_model_name, torch::kCUDA);`

## Author
Shlomo Kashani, Head of AI at DeepOncology AI, 
Kaggle Expert, Founder of Tel-Aviv Deep Learning Bootcamp: shlomo@deeponcology.ai

## Technologies
This projects makes use of several technologies:
- [Docker](https://www.docker.com/): for bundling all the dependencies of our program and for easier deployment.
- [Libtorch](https://github.com/BVLC/caffe): because it has good performance and a simple C++ API.

Torch has now two versions:
Download here (Pre-cxx11 ABI): 
https://download.pytorch.org/libtorch/cu100/libtorch-shared-with-deps-1.2.0.zip

Download here (cxx11 ABI, compiled with _GLIBCXX_USE_CXX11_ABI = 1): 
https://download.pytorch.org/libtorch/cu100/libtorch-cxx11-abi-shared-with-deps-1.2.0.zip

- [OpenCV](http://opencv.org/): to have a simple C++ API for GPU image processing.

# Building

## Prerequisites
- A Kepler or Maxwell NVIDIA GPU with at least 2 GB of memory.
- A Linux system with recent NVIDIA drivers (recommended: 415).
- Install the latest version of [Docker](https://docs.docker.com/linux/step_one/).
- Install [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)).

## Build command
The command might take a while to execute:
```
```


# Testing

## Starting the server
Execute the following command and wait a few seconds for the initialization of the classifiers:
```
```

## Single image Classifiation

```
```

## Tested CNN models

- ResNet9
- ResNet18
- ResNet50
- ResNet101

## Performance:

<table><tbody>
    <th valign="bottom">Architecture</th>
    <th valign="bottom">Threads</th>
    <th valign="bottom">Batch Size</th>    
    <th valign="bottom">Inference Speed(fps)</th>
    <tr>
        <td rowspan="2">ResNet34</td>
        <td>1</td><td>1</td><td>200</td>        
    </tr>    
   
</tbody></table>

The inference speed is benchmarked on a single NVIDIA Pascal Titan Xp GPU, without visualization.

## Environment
The code is developed under the following configurations.
- Hardware: 1 GPU for testing 
- Software: Ubuntu 16.04.3 LTS, ***CUDA>=10.0, Python>=3.6, PyTorch>=1.2.0***
- Dependencies: refer to the docker file


## Benchmarking performance
We can benchmark the performance of our inference server using any tool that can generate HTTP load. We included a Dockerfile
for a benchmarking client using [rakyll/hey](https://github.com/rakyll/hey):
```
```


## Contributing

Feel free to report issues during build or execution. We also welcome suggestions to improve the performance of this application.

### Citation

If you find the code or trained models useful, please consider citing:

```
@misc{DarkTorch2019,
  author={Kashani, Shlomo},
  title={DarkTorch2019},
  howpublished={\url{https://github.com/QuantScientist/DarkTorch/}},
  year={2019}
}
```

