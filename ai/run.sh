#!/bin/bash

USER_ID=$(id -u)
GROUP_ID=$(id -g)

docker pull paulgauthier/aider-full
docker run -it --user skogix --volume $(pwd):/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY --config .aider.conf.yml
