#!/usr/bin/bash

cd /usr/share/friture
virtualenv -p /usr/bin/python3.11 buildenv
source ./buildenv/bin/activate
cd /usr/share/friture
pip3.11 install .[dev]
python3.11 setup.py build_ext --inplace

