#!/bin/sh -l

echo "Hello this is docker bash script rendertex.sh"
echo "Currently working at $PWD" # /usr/app
# ls -la ./*
# make pdflatex_roboto
# make pdflatex_fourier
echo "making $1" # ???
make $1
echo 
echo "Rendering done."
echo "$time" >> $GITHUB_OUTPUT