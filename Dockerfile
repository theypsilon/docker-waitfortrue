FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends mysql-client curl wget telnet ngrep && rm -rf /var/lib/apt/lists/*
ENV TIMEOUT_SECONDS "100"
ENV DEBUG "false"
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]