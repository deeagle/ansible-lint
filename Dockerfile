FROM alpine:3

LABEL org.opencontainers.image.authors="Martin Kock <code@deeagle.de>" \
      org.opencontainers.image.url="https://github.com/deeagle/ansible-lint" \
      org.opencontainers.image.licenses="GPL3" \
      org.opencontainers.image.title="Ansible linter in a container." \
      org.opencontainers.image.description="ansible-lint in an alpine container for CI." \
      org.opencontainers.image.vendor="deeagle.de"


RUN apk --no-cache add ansible-lint
