echo "> Build image"
docker build -t claude-code:${CLI_REPO_NAME} ${CLI_REPO_DIR}/conf/docker/claude-code

echo "> Start container"
docker run -d \
    -v ${CLI_REPO_MAPPING_DIR}/plan:/plan \
    --name claude-cli-srv \
    claude-code:${CLI_REPO_NAME} bash -c "sleep infinity"

docker exec -ti claude-cli-srv bash claude.sh
