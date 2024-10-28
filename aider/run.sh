#!/bin/bash
source ~/.ssh/openai.sh
# sudo docker run -it --volume /home/skogix/dev:/app skogixai --openai-api-key $OPENAI_API_KEY
# sudo docker pull paulgauthier/aider-full
sudo docker run -it --volume /home/skogix/dev:/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY
#--config /home/skogix/dev/aider/.aider.conf.yml
