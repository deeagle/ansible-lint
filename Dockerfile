FROM alpine:3.22.0

LABEL org.opencontainers.image.authors="Martin Kock <code@deeagle.de>" \
      org.opencontainers.image.url="https://github.com/deeagle/ansible-lint" \
      org.opencontainers.image.title="Ansible linter in a container." \
      org.opencontainers.image.description="ansible-lint in an alpine container for CI." \
      org.opencontainers.image.vendor="deeagle.de"

# APT/PIP break system packages (error: externally-managed-environment)
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN apk --no-cache add ansible-lint \
                       py3-jsonschema \
                       py3-pip \
                       yamllint \
    && pip3 install --no-cache-dir ansible-lint~=24.12.0

COPY ["lint-test.yml", "/opt/lint-test.yml"]

RUN ["ansible-lint", "/opt/lint-test.yml"]
