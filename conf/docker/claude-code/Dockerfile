# Step : Install base image
FROM ubuntu:24.04

## Update linux and tools
RUN apt update -y
RUN apt install -y \
  curl

# Step : Install Claude Code
RUN curl -fsSL https://claude.ai/install.sh | bash

## Setting container startup
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
ADD ./claude.sh /claude.sh
RUN chmod +rx /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
