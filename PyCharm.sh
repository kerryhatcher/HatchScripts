#!/bin/bash

echo "
The MIT License (MIT)

Copyright (c) 2014 Kerry Hatcher

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"


yum-config-manager --enable rhel-6-workstation-thirdparty-oracle-java-rpms

yum -y install wget java-1.7.0-oracle java-1.7.0-oracle-devel java-1.7.0-oracle-jdbc java-1.7.0-oracle-plugin

wget http://download-cf.jetbrains.com/python/pycharm-professional-3.1.3.tar.gz

tar -xzf pycharm-professional-3.1.3.tar.gz

rm -f pycharm-professional-3.1.3.tar.gz

./pycharm-3.1.3/bin/pycharm.sh

rm -rf pycharm-3.1.3


