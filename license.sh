#!/bin/bash

sudo apt install -y grep

echo "TASKINFO: Check if the repo has a valid license"
set -e

set -u

[[ "${DEBUG}" == "false" ]] || set -x

shopt -s nocaseglob
if ls license*; then
  echo "Found file 'license*'" 1>&2
  echo "Running regex test" 1>&2
  # Only fail if license is present but not one of the specified ones
  /usr/bin/egrep -zoi '(apache.*2.0|affero general public license)' license*
  exit
fi
