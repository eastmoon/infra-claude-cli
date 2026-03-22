## Execute prompt with
ANTHROPIC_API_FILE=${CLI_REPO_DIR}/conf/devops/keys/ANTHROPIC_API_KEY
if [ -e ${ANTHROPIC_API_FILE} ]; then
    ANTHROPIC_API_KEY=$(cat ${ANTHROPIC_API_FILE})
    docker run -ti --rm \
        -e ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY} \
        -v ${CLI_REPO_MAPPING_DIR}/plan:/plan \
        claude-code:${CLI_REPO_NAME} plan "${@}"
else
    echo "[-] Error : Can't find Anthropic API key."
fi
