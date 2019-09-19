#!/bin/bash

############################
#
# Name: Bootstrap fetcher
# Author: Barry Smith
#
############################

VERSION="4.3.1"

echo "Cleaning old files"
rm -rf ./static/css/bootswatch
mkdir -p ./static/css/bootswatch

echo "Downloading bootstrap version $VERSION"
mkdir -p ./static/css/bootswatch/default
wget https://github.com/twbs/bootstrap/releases/download/v$VERSION/bootstrap-$VERSION-dist.zip
unzip -p bootstrap-$VERSION-dist.zip bootstrap-$VERSION-dist/css/bootstrap.min.css > ./static/css/bootswatch/default/bootstrap.min.css

echo "Downloading bootswatch versiob $VERSION"
wget https://github.com/thomaspark/bootswatch/archive/v$VERSION.tar.gz
tar xvf v$VERSION.tar.gz --strip-components=2 -C ./static/css/bootswatch/ bootswatch-$VERSION/dist
for i in cerulean cyborg flatly litera lux minty sandstone sketchy solar superhero yeti cosmo darkly journal lumen materia pulse simplex slate spacelab united
do
    rm -f ./static/css/bootswatch/$i/{_bootswatch.scss,_variables.scss,bootstrap.css}
done

echo "Cleaning up"
rm -f ./bootstrap-$VERSION-dist.zip ./v$VERSION.tar.gz
