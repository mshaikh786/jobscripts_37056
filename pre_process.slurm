#!/bin/bash 

#SBATCH --gpus=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

#activate your conda enviroment 
source ~/miniconda3/bin/activate porous_media
export BASE_DIR=../
mkdir -p ${BASE_DIR}/berea_ti
python ${BASE_DIR}/code/preprocess/create_training_images.py --image ${BASE_DIR}/data/berea/original/raw/berea.tif --name berea --edgelength 64 --stride 32 --target_dir ${BASE_DIR}/berea_ti


