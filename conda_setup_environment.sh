ENV_NAME="test_env"

conda config --set channel_priority strict
mamba create -y --name $ENV_NAME python=$PYTHON_VERSION
mamba env update --file conda_environment.yml -n $ENV_NAME
mamba env update --file conda_environment_dev.yml -n $ENV_NAME
conda info
conda list -n $ENV_NAME
