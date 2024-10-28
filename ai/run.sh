#!/bin/bash

USER_ID=$(id -u)
GROUP_ID=$(id -g)

sudo docker pull paulgauthier/aider-full
sudo docker run -it --user $USER_ID:$GROUP_ID --volume $(pwd):/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY --config .aider.conf.yml
