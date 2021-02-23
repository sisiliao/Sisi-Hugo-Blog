#!/bin/bash

rm -rf public/
hugo
docker build -t hugo-sisi .
process=$(docker ps -q)
if [[ $process ]]
then
    echo "$process"
    docker kill $process
    docker rm $process
fi

docker build -t hugo-sisi .
docker run -dit --name hugo-sisi -p 9389:80 -v $HOME/hugo/public/:/usr/local/apache2/htdocs/ httpd:2.4