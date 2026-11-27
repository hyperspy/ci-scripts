# Fail the job on the first failed command instead of continuing into the
# test steps with a broken or bare test environment.
set -e
ENV_NAME="test_env"

conda config --set channel_priority strict
mamba create -y --name $ENV_NAME python=$PYTHON_VERSION
# Target $ENV_NAME explicitly on both updates: the Miniforge base
# environment is active in the job, so a nameless `mamba env update` would
# apply these files to the base environment instead of test_env, leaving
# test_env bare and the test step failing at `pytest: command not found`
# (exit 127).
mamba env update --name $ENV_NAME --file conda_environment.yml
mamba env update --name $ENV_NAME --file conda_environment_dev.yml
conda info
conda list -n $ENV_NAME