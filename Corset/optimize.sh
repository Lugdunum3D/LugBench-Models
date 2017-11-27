#!/usr/bin/env bash

mogrify -quality 95 -format jpg *.png
rm *.png
sed -i 's/\.png/\.jpg/' *.gltf
