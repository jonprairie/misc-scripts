#!/usr/bin/env bash
#
# this script should probably be called "setup common lisp"

HOME=$2

cd "$HOME"
mkdir Downloads

curl -sL "$(curl -s https://api.github.com/repos/roswell/roswell/releases/latest | jq -r '.assets | .[] | select(.name|test("\\.deb$")) | .browser_download_url')" --output roswell.deb
sudo dpkg -i roswell.deb
rm roswell.deb

ros install sbcl
ros install ccl-bin
ros install quicklisp
ros -e "(ql-dist:install-dist \"http://dist.ultralisp.org/\" :prompt nil)"

# i just have too much trouble with clpm, the docs don't help as much as they should
# for how extensive they are. sticking with QL/UL + maybe QLOT later if i need it.
# clpm
# curl -sO https://files.clpm.dev/clpm/clpm-0.4.1-linux-amd64.tar.gz \
#     && curl -sO https://files.clpm.dev/clpm/clpm-0.4.1.DIGESTS.asc \
#     && gpg --keyserver hkps://keyserver.ubuntu.com --receive-keys 0x10327DE761AB977333B1AD7629932AC49F3044CE \
#     && gpg --decrypt clpm-0.4.1.DIGESTS.asc \
#     && cat clpm-0.4.1.DIGESTS.asc | grep "$(shasum -a 512 clpm-0.4.1-linux-amd64.tar.gz)" \
#     && echo "shasum512 matches, installing..." \
#     && tar xf clpm-0.4.1-linux-amd64.tar.gz \
#     && cd clpm-0.4.1-linux-amd64 && sh ./install.sh \
#     && cd .. \
#     && rm clpm-0.4.1-linux-amd64.tar.gz \
#     && rm clpm-0.4.1.DIGESTS.asc \
#     && rm -rf clpm-0.4.1-linux-amd64
#
SRCCONF="$HOME/.config/common-lisp/source-registry.conf.d"
# CLPMCONF="$HOME/.config/clpm"
#
# mkdir -p "$CLPMCONF"
mkdir -p "$SRCCONF"
# echo '("quicklisp" :type :quicklisp :url "https://beta.quicklisp.org/dist/quicklisp.txt")' > "$CLPMCONF/sources.conf"
# clpm client source-registry.d > "$SRCCONF/20-clpm-client.conf"
#
# clpm client rc --quicklisp-alternative > "$HOME/.sbclrc"
#
echo "(:tree \"$HOME/external/src/cl/\")" > "$SRCCONF/10-local-projects.conf"
