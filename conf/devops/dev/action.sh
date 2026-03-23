echo "> Build image"
docker build -t claude-code:${CLI_REPO_NAME} ${CLI_REPO_DIR}/conf/docker/claude-code

echo "> Start container"
ENV_CONF=
ANTHROPIC_API_FILE=${CLI_REPO_DIR}/conf/devops/keys/ANTHROPIC_API_KEY
if [ -e ${ANTHROPIC_API_FILE} ]; then
    ANTHROPIC_API_KEY=$(cat ${ANTHROPIC_API_FILE})
    ENV_CONF="${ENV_CONF} -e ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}"
else
    echo "[+] Can't find Gemini API key, Places use 'Claude account' login."
fi

docker run -ti --rm \
    ${ENV_CONF} \
    claude-code:${CLI_REPO_NAME} bash
