## Incremental Object Detection via Meta-Learning


## Installation and setup
- Install the Apex library that is packages along with this code base. See [INSTALL.md](INSTALL.md).
- Download and extract Pascal VOC 2007 to `./datasets/VOC2007/`
- Use the script to reproduce: `scripts/run_firststep.sh` first and then `run_iod.sh` to perform iod task.
- Otherwise, you can download the model weight after firststep here: [Google Drive](https://drive.google.com/file/d/1LH7OY-uMifl2gwCFEgm6U5h_Xfh1nPcH/view?usp=sharing)

## Model Performances and Logs

| Setting | Year |  Achieved mAP  | Goal Performance | Logs |
|:-------:|:----:|:--------------:|:----------------:|:----:|
|  10-10  | 2024 |      70.7      |       67.5       | sss  |



##### Configurations with which the above results were reproduced:
- Python version: 3.9
- PyTorch version: 1.10.0
- CUDA version: 11.3
- GPU: NVIDIA GTX 1080-ti


## How to run
#### 1. Train the first task

For the setting of the Pascal-VOC dataset, the first task usually contains categories 5, 10, 15 and 19. 
So when we train the first task for different settings, we could only train four kinds of the first task.
First, choosing the correspoinding task setting (e.g., `taks=10-10`) in the `scripts/run_firststep.sh` file according to your needs, and then run:


#### 2. Select the box rehearsal for the first task

To avoid repeated calculations with the same first task, we place the box rehearsal in the output root of the first task, and then run:

``` shell script
bash scripts/run_firststep.sh
``` 

#### 3. Train the single incremental setting task

The default IOD setting shell script for reproduction is provided in `run.sh`.

You can simply run:
``` shell script
bash run_iod.sh
``` 

#### 4. For more Detailed Setting
You can find three scripts in the `scripts/` file: `run_JT.sh`,  `run_MI.sh`, and `run_SI.sh`. The file can be used to run, respectively: single-incremetal-step detection settings (19-1, 15-5, 10-10, 5-15), multi-incremental-step detection settings (10-5, 10-2, 15-1, 10-1, 5-5).

Without specifying any option, the defaults will load the Finetune method using the Faster-RCNN. 
You can play with the following parameters to obtain all the results in the paper:
- `--feat` with options [`no`, `std`, `ard`]. No means not using feature distillation, `std` is the feature distillation employed in Faster-ILOD, while `ard` is the attentive RoI distillation - (default: no).
- `--inc` will enable the incremental setting - (default: not use);
- `--dist_type` with options [`l2`, `id`, `none`], where `l2` is the distillation used in ILOD, `id` the Inclusive Distillation Loss used in our method ABR, and `none` means not use it (default: l2);
You can modify the `scripts/run_SI.sh` to meet experiment settings.
For example,
``` shell script
task=10-10
name=ABR_LR001_BS4_ALPHA05_BETA1_GAMMA1_INIT
exp -t ${task} -n ${name} -s ${step} --feat ard -gamma 1.0 --uce --dist_type id -alpha 0.5 -beta 1.0 -mb 2000 -mt mean -cvd 0,1
``` 
, and then run:

``` shell script
bash scripts/run_SI.sh
``` 




# Acknowledgments
Our repository is based on the amazing work of @fcdl94[MMA](https://github.com/fcdl94/MMA), @CanPeng123 [FasterILOD](https://github.com/CanPeng123/Faster-ILOD), and on the [maskrcnn-benchmark](https://github.com/facebookresearch/maskrcnn-benchmark) library. We thank the authors and the contibutors of these projects for releasing their code.
