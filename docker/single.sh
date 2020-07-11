# python tools/train.py configs/solov2/solov2_r101_3x.py
# ./tools/dist_train.sh configs/solov2/solov2_r101_3x.py  2

#./tools/dist_train.sh configs/foveabox/fovea_r50_fpn_4gpu_1x.py  1 --validate
#./tools/dist_train.sh /root/sharedfolder/production/SOLO/configs/grid_rcnn/grid_rcnn_gn_head_x101_32x4d_fpn_2x.py  1 --validate
#./tools/dist_train.sh configs/foveabox/fovea_r50_fpn_4gpu_1x.py  1 --validate
CUDA_VISIBLE_DEVICES="0,1,2,3" PORT="29500" bash ./tools/dist_train.sh configs/foveabox/fovea_ms_r101_fpn_4gpu_2x_align.py  4 --validate
