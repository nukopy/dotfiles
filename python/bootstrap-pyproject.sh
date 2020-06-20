#!/bin/bash

# print software versions
echo $(python --version)
echo $(poetry --version)
echo "direnv $(direnv --version)"

echo "===== START: create Python project: 6 steps ====="

# define variables
WORK_DIR="$(pwd)"

echo "1. Create venv ..."
python -m venv venv

echo "2. Activate venv ..."
source venv/bin/activate

echo "3. Create poetry settings(pyproject.toml) ..."
cat $PYDOTDIR/pyproject.toml > $WORK_DIR/pyproject.toml

echo "4. Install Python dev-dependencies: flake8, black, ipython, jupyterlab, pytest ..."
poetry add --dev \
    flake8 \
    black \
    ipython \
    jupyterlab \
    pytest

echo "5. Lock dependencies ..."
poetry lock

echo "5. Add .envrc ..."
cat $PYDOTDIR/.envrc-pyproject > $WORK_DIR/.envrc

echo "6. Add activate direnv ..."
direnv allow

echo "===== DONE: create Python project ====="
