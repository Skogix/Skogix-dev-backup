#!/bin/bash
source ~/.ssh/openai.sh
sudo docker build -t paulgauthier/aider-full -f aider/source/docker/Dockerfile .
sudo docker run -it --user $(id -u):$(id -g) --volume /home/skogix/dev:/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY
#--config /home/skogix/dev/aider/.aider.conf.yml
