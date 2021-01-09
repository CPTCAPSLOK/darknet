#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR
if  [ -f "/usr/bin/bazel" ]; then
    /usr/bin/bazel run --cxxopt='-std=c++11' :install_darknet -- $DIR/installed
    /usr/bin/bazel run --cxxopt='-std=c++11' :install_uselib -- $DIR/installed
else
    echo "Bazel not found! Please install it https://docs.bazel.build/versions/master/install.html"
fi
