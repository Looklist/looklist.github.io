#/bin/bash
rm -rf docs
gitbook build
mv _book docs
rm docs/.git