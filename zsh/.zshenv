######################
# General
######################

export HOMEBREW_BREWFILE="/Users/pyteyon/Projects/dotfiles/homebrew/Brewfile"

######################
# Python
######################

## dotfiles' python dir
export PYDOTDIR="/Users/pyteyon/Projects/dotfiles/python"

## PYTHONPATH for import packages
# AtCoder Stream
export PYTHONPATH="/Users/pyteyon/Projects/MyProjects/AtCoderStream/atcoder-stream-backend/libraries/lib"
PYTHONPATH="${PYTHONPATH}:/Users/pyteyon/Projects/MyProjects/AtCoderStream/atcoder-stream-backend/libraries/twitterapi"

# kurodalab
APP_HOME='/Users/pyteyon/Projects/research/Kurodalab/src'
PYTHONPATH="${PYTHONPATH}:${APP_HOME}"

# poc streamlit
APP_HOME='/Users/pyteyon/Projects/InternProjects/JXPressCorp/task/task04/poc/src'
PYTHONPATH="${PYTHONPATH}:${APP_HOME}"

# jxpress
# APP_HOME="/Users/pyteyon/Projects/InternProjects/JXPressCorp/task/task04/rdd/misc/reporting/backend"
# PYTHONPATH="${PYTHONPATH}:${APP_HOME}"

## pipenv
# create ".venv" dir when "pipenv init"
export PIPENV_VENV_IN_PROJECT=true

## AirFlow
export AIRFLOW_HOME=~/airflow
export AIRFLOW_GPL_UNIDECODE=yes

######################
# utility functions
######################

# timestamp
calc_timediff () {
    # $1: start_time
    # $2: end_time
    diff_time=$(($2 - $1))
    ((hrs=diff_time/3600, min=(diff_time%3600)/60, sec=diff_time%60))
    timestamp=$(printf "%02d hr %02d min %02d sec" $hrs $min $sec)
    echo $timestamp
}

######################
# others
######################

## serverless framework
# export SLS_DUBUG=*
