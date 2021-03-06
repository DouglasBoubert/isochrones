# http://conda.pydata.org/docs/travis.html#the-travis-yml-file
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
fi
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

# Conda Python
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a
conda create --yes -n test python=$PYTHON_VERSION
conda activate test

# pip install pandoc=2.0.0
conda install -c conda-forge numpy numba cython pytables pandas
conda install -c conda-forge multinest pymultinest
conda install -c conda-forge pytest codecov
pip install flaky
# conda install -c pyviz pyviz
# conda install -c conda-forge nbsphinx
# pip install sphinx_rtd_theme
python setup.py install
