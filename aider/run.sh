#!/bin/bash
source ~/.ssh/openai.sh
# sudo docker run -it --volume /home/skogix/dev:/app skogixai --openai-api-key $OPENAI_API_KEY
# sudo docker pull paulgauthier/aider-full
CONTAINER_NAME="aider-container"

# Check if the container exists (running or stopped)
if [ "$(sudo docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    # Start the container if it is stopped
    if [ ! "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
        sudo docker start $CONTAINER_NAME
    fi
    # Connect to the existing container
    sudo docker exec -it $CONTAINER_NAME /bin/bash
else
    # Run a new container if it does not exist
    sudo docker run -it --name $CONTAINER_NAME --volume /home/skogix/dev:/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY
fi
#--config /home/skogix/dev/aider/.aider.conf.yml
