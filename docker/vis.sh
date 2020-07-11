#python tools/test_ins_vis.py configs/solov2/solov2_r101_3x.py  ./work_dirs/solo_r101_3x/latest.pth --show --save_dir  work_dirs/vis_solo --validate
python tools/test.py configs/gnws/mask_rcnn_x101_32x4d_fpn_gn_ws_2x.py  ./work_dirs/mask_rcnn_x101_32x4d_fpn_gn_ws_2x/latest.pth  --out  x.pkl --eval bbox
