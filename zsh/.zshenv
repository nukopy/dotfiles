echo "Running $ZDOTDIR/.zshenv ..."

######################
# Python
######################

## PYTHONPATH for import packages
export PYTHONPATH="/Users/pyteyon/Projects/MyProjects/AtCoderStream/atcoder-stream-backend/libraries/lib"
export PYTHONPATH="${PYTHONPATH}:/Users/pyteyon/Projects/MyProjects/AtCoderStream/atcoder-stream-backend/libraries/twitterapi"

## pipenv
# create ".venv" dir when "pipenv init"
export PIPENV_VENV_IN_PROJECT=true
