SSH_PRV_KEY_DIR=""
SSH_PUB_KEY_DIR=""

podman build --build-arg SSH_PRV_KEY="$(cat $SSH_PRV_KEY_DIR)" --build-arg SSH_PUB_KEY="$(cat $SSH_PUB_KEY_DIR)" -t filesystem-livesync -f docker/Dockerfile .
