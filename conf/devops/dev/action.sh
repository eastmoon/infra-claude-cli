echo "> Build image"
docker build -t claude-code:${CLI_REPO_NAME} ${CLI_REPO_DIR}/conf/docker/claude-code

echo "> Start container"
ANTHROPIC_API_FILE=${CLI_REPO_DIR}/conf/devops/keys/ANTHROPIC_API_KEY
if [ -e ${ANTHROPIC_API_FILE} ]; then
    ANTHROPIC_API_KEY=$(cat ${ANTHROPIC_API_FILE})
    docker run -ti --rm \
        -e ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY} \
        claude-code:${CLI_REPO_NAME} bash
else
    echo "[-] Error : Can't find Anthropic API key."
fi
