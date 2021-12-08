#!/bin/bash
source $CONDA_PATH/etc/profile.d/conda.sh
conda activate pytorch-deepdream
jupyter notebook --notebook-dir=/app --ip='*' --port=8888 --no-browser --allow-root
