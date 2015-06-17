#/bin/bash

gitbook build

rm -rf docs
mv _book docs
rm docs/.git