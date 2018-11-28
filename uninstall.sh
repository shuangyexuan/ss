#!/bin/sh
cd privoxy-3.0.26-stable
make uninstall

pip uninstall shadowsocks -y
python -m pip uninstall pip -y
