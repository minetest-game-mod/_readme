#!/usr/bin/env bash

if [[ $# == 0 ]]; then
  ./for-splitted-repo 'git --no-pager tag --list'
else
  tag=$1
  ./for-splitted-repo "git tag $tag; git push --tags"
fi
