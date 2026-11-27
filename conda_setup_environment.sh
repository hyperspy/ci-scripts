set -e
ENV_NAME="test_env"

conda config --set channel_priority strict
mamba create -y --name $ENV_NAME python=$PYTHON_VERSION
mamba env update --name $ENV_NAME --file conda_environment.yml
mamba env update --name $ENV_NAME --file conda_environment_dev.yml
conda info
conda list -n $ENV_NAME