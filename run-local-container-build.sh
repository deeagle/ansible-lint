#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

CONTAINER_NAME="ansible-lint"
CONTAINER_TAG="local-dev"

function main() {
  echo "Build local containers ..."
  build_containers
  echo "Build local containers successfully finished."
  show_images_in_local_registry
}

# Build local containers
function build_containers() {
  docker build --no-cache -t ${CONTAINER_NAME}:${CONTAINER_TAG} .
}

# Show images in local registry
function show_images_in_local_registry() {
  docker images | grep ${CONTAINER_NAME}
}

main "$@"