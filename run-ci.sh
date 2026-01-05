#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

MD_CONTAINER="registry.gitlab.com/pipeline-components/markdownlint-cli2:latest"
MD_BIN="markdownlint-cli2"

echo "Running CI ..."

echo "Lint Markdown ..."
md_linter_version="$(docker run --rm -i ${MD_CONTAINER} ${MD_BIN} -v)"
echo "Using markdown-linter version ${md_linter_version}"
docker run --rm -i -v "${PWD}/:/code" "${MD_CONTAINER}" "${MD_BIN}" {*.md,!CHANGELOG.md}

echo "Lint Dockerfiles ..."
docker_linter_version="$(docker run --rm -i ghcr.io/hadolint/hadolint hadolint -v)"
echo "Using docker-linter version: ${docker_linter_version}"
dockerfiles=$(find . -type f -name "*Dockerfile" -not -path "./vendor/*" -not -path "./tmp/*")
for dockerfile in ${dockerfiles}; do
  echo "> lint file: $dockerfile"
  docker run --rm -i -v "${PWD}/.hadolint.yml:/.config/hadolint.yml" ghcr.io/hadolint/hadolint < "$dockerfile"
done

echo "Running CI successfully finished."
