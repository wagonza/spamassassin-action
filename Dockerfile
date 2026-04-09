FROM debian:12-slim

LABEL org.opencontainers.image.description="SpamAssassin container for GitHub Action spamassassin"
LABEL org.opencontainers.image.source=https://github.com/wagonza/spamassassin-action

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        spamassassin \
        rsync \
        curl \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod 555 /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
