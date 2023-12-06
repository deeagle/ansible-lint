#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

echo "Running CI ..."

echo "Lint Dockerfiles ..."
docker_linter_version="$(docker run --rm -i ghcr.io/hadolint/hadolint hadolint -v)"
echo "Using docker-linter version: ${docker_linter_version}"
dockerfiles=$(find . -type f -name "*Dockerfile" -not -path "./vendor/*" -not -path "./tmp/*")
for dockerfile in ${dockerfiles}; do
  echo "> lint file: $dockerfile"
  docker run --rm -i -v "${PWD}/.hadolint.yml:/.config/hadolint.yml" ghcr.io/hadolint/hadolint < "$dockerfile"
done

echo "Running CI successfully finished."
