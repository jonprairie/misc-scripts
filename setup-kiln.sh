#!/usr/bin/env sh

# gonna wait on this since build.sh doesn't seem to support roswell yet?

# https://github.com/ruricolist/kiln/blob/master/INSTALL.md
mkdir -p ~/external/src/cl/
cd ~/external/src/cl/ || echo "cd failed" && exit

git clone https://github.com/ruricolist/kiln.git
cd kiln || echo "cd failed" && exit

make

ln -s "$(pwd -P)"/kiln "${HOME}"/.local/bin/kiln

make test && make install
