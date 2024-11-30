#! /usr/bin/bash

d=$(date +%Y-%m-%d)

git pull
git stage *
git commit -m "Update $d"
git push
