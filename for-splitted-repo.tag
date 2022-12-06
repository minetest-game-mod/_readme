#!/usr/bin/env bash

set -e

. colors

if [[ $# -ne 2 ]]; then
  ./for-splitted-repo 'git --no-pager tag --list'
  echo "============================================="
  echo "${green}Usage:${reset} $0 <branch> <tag>"
  echo "============================================="
  exit 1;
fi

branch=$1
tag=$2

echo "${green}Branch:${reset} ${bold}$branch${reset}"
echo "${green}   Tag:${reset} ${bold}$tag${reset}"
# c.askContinue "Continue with tagging"

./for-splitted-repo "
    git fetch -p;
    git checkout $branch;
    git pull;
    git tag $tag;
    git push --tags
"
