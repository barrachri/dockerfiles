#!/bin/bash

RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
donwload nginx configuration add to /etc/nginx
download upstream.appserver add to /etc/nginx/upstream.appserver

cd /etc/nginx
eval "echo \"`cat upstream.appserver`\"" >> nginx.conf
service nginx start