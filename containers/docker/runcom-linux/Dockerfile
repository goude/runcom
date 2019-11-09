FROM goude/developer-linux
MAINTAINER Daniel Goude <daniel@goude.se>

USER runcom
WORKDIR /home/runcom

RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  mkdir -p tmp/ && \
  git clone https://github.com/goude/runcom.git tmp/runcom && \
  tmp/runcom/setup/runcom-bootstrap.sh && \
  rm -rf tmp/runcom && \
  env > /home/runcom/.runcom-build-env && \
  echo "runcom-linux $(date --iso-8601=seconds)" >> /home/runcom/.runcom-log
