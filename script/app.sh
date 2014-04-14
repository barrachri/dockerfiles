#!/bin/bash
set -e

########## SECRET CONFIGURATION
# See: https://docs.djangoproject.com/en/dev/ref/settings/#secret-key
# Note: This key only used for development and testing.
#export SECRET_KEY="ij)el^9!ys9f05%46jorg3-s-5bf!$dn94)bti6h7%hrl2vq8e"
########## END SECRET CONFIGURATION
pip install -r /app/requirements.txt
exec uwsgi --socket 127.0.0.1:8005 --wsgi-file api/wsgi.py --chdir /app/api_rep --master --processes 2 --threads 2