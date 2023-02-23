# get conda by
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh;
# chmod u+x Miniconda*;

source activate base;
pip install -U --user gpustat ranger-fm;
# symbolic link, generally in ~/.local/bin
ln -s $( which ranger ) ~/tools/ranger
ln -s $( which gpustat ) ~/tools/gpustat
