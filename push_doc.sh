#! /usr/bin/bash

d=$(date +%Y-%m-%d)

git stage *
git commit -m "Update $d"
git push
