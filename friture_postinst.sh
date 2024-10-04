#!/usr/bin/bash

cd /usr/share/friture
virtualenv -p /usr/bin/python3.11 buildenv
source ./buildenv/bin/activate
ls
pip3.11 install -r requirements.txt
python3.11 setup.py build_ext --inplace

