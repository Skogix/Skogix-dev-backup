#!/bin/bash

sudo docker pull paulgauthier/aider-full
sudo docker run -it --user $(id -u):$(id -g) --volume $(pwd):/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY --config .aider.conf.yml
