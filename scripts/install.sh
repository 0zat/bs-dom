#!/bin/sh

set -e
# echo $PATH
echo $(bsc -where)

# compile
mkdir -p lib/js
bsc -bs-package-name bs-dom -bs-package-output lib/js -I src -c -bs-files src/*.mli src/*.ml

# install
mkdir -p lib/ocaml
cp ./src/*.cm* ./lib/ocaml 

# hide module
rm ./lib/ocaml/util.cmi 