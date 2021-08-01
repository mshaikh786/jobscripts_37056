#!/bin/bash 

#SBATCH --gpus=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

#activate your conda enviroment 
source ~/miniconda3/bin/activate porous_media
export BASE_DIR=$PWD
mkdir -p berea_ti
python $PWD/code/preprocess/create_training_images.py --image ${PWD}/data/berea/original/raw/berea.tif --name berea --edgelength 64 --stride 32 --target_dir berea_ti


