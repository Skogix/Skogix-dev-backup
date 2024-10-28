#!/bin/bash
source ~/.ssh/openai.sh
# sudo docker run -it --volume /home/skogix/dev:/app skogixai --openai-api-key $OPENAI_API_KEY
# sudo docker pull paulgauthier/aider-full
CONTAINER_NAME="aider-container"

# Check if the container is running
if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    # Connect to the existing container
    sudo docker exec -it $CONTAINER_NAME /bin/bash
else
    # Run a new container if not running
    sudo docker run -it --name $CONTAINER_NAME --volume /home/skogix/dev:/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY
fi
#--config /home/skogix/dev/aider/.aider.conf.yml
