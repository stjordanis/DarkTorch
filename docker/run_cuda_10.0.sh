#!/usr/bin/env bash
sudo nvidia-docker run -it --shm-size=4g --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v /tmp/.X11-unix:/tmp/.X11-unix:rw -p 8097:8097  -p 3122:22 -p 7842:7842 -p 8787:8787 -p 8786:8786 -p 8788:8788 -p 8888:8888 -p 5000:5000 -v ~/dev/:/root/sharedfolder -v ~/dev/.torch/models/:/root/.cache/torch/checkpoints/ cuda10-trt  bash
