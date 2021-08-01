#!/bin/bash 

#SBATCH --gpus=1
#SBATCH --constraint=v100
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00
#SBATCH --output=train_%j.out
#SBATCH --error=train_%j.out


#activate your conda enviroment 
source ~/miniconda3/bin/activate porous_media
export BASE_DIR=$PWD

# In case you get an error of port not avialable, try changing the port number incrementally.
DASHBOARD_PORT=10010
nvdashboard ${DASHBOARD_PORT} &
cat << EOF 
"NVDashboard can be launched in your browser with following steps.
Copy and paste the following line in a new terminal.
ssh -L ${DASHBOARD_PORT}:${HOSTNAME}:${DASHBOARD_PORT} $USER@glogin.ibex.kaust.edu.sa
Now in your web browser on your workstation/laptop, copy paste the following:
http://localhost:${DASHBOARD_PORT}
EOF


cd code/pytorch
python main.py --dataset 3D --dataroot ${BASE_DIR}/berea_ti --imageSize 64 --batchSize 128 --ngf 64 --ndf 16 --nz 512 --niter 1000 --lr 1e-5 --workers ${SLURM_CPUS_PER_TASK} --ngpu ${SLURM_GPUS} --cuda

