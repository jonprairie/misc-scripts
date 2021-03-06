#!/usr/bin/env bash
#
# this script should probably be called "setup common lisp"

HOME=$2

cd "$HOME"

# clpm
curl -sO https://files.clpm.dev/clpm/clpm-0.4.1-linux-amd64.tar.gz \
    && curl -sO https://files.clpm.dev/clpm/clpm-0.4.1.DIGESTS.asc \
    && gpg --keyserver hkps://keyserver.ubuntu.com --receive-keys 0x10327DE761AB977333B1AD7629932AC49F3044CE \
    && gpg --decrypt clpm-0.4.1.DIGESTS.asc \
    && cat clpm-0.4.1.DIGESTS.asc | grep "$(shasum -a 512 clpm-0.4.1-linux-amd64.tar.gz)" \
    && echo "shasum512 matches, installing..." \
    && tar xf clpm-0.4.1-linux-amd64.tar.gz \
    && cd clpm-0.4.1-linux-amd64 && sh ./install.sh \
    && cd .. \
    && rm clpm-0.4.1-linux-amd64.tar.gz \
    && rm clpm-0.4.1.DIGESTS.asc \
    && rm -rf clpm-0.4.1-linux-amd64

SRCCONF="$HOME/.config/common-lisp/source-registry.conf.d"
CLPMCONF="$HOME/.config/clpm"

mkdir -p "$CLPMCONF"
mkdir -p "$SRCCONF"
echo '("quicklisp" :type :quicklisp :url "https://beta.quicklisp.org/dist/quicklisp.txt")' > "$CLPMCONF/sources.conf"
clpm client source-registry.d > "$SRCCONF/20-clpm-client.conf"

clpm client rc --quicklisp-alternative > "$HOME/.sbclrc"

echo "(:tree \"$HOME/src/\")" > "$SRCCONF/10-local-projects.conf"
