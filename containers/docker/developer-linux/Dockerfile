FROM goude/base-linux
MAINTAINER Daniel Goude <daniel@goude.se>

# Developer packages
# --no-install-recommends \
# nodejs nodejs-legacy npm \
RUN \
  apt-get update && \
  apt-get install -y \
    golang \
    ghc \
    pandoc \
    python-dev \
    python3-dev python3-pip python3-venv \
    python3-lxml \
    python3-cairo \
    python3-matplotlib python3-pandas \
    python3-sklearn \
    openjdk-8-jre-headless && \
  apt-get clean
