FROM cypress/included:10.1.0 AS cypress
ENV CYPRESS_CACHE_FOLDER=/home/node/.cache/Cypress
# USER node
RUN cypress install

FROM cypress AS cypress-with-mongo
USER root
RUN apt-get update && apt-get install --no-install-recommends -y git openssh-server gnupg curl wget ca-certificates lsb-release; \
  update-ca-certificates; \
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -; \
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list; \
  apt-get update && apt-get install --no-install-recommends -y mongodb-org mongodb-org-tools; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /data/db /var/log/mongodb \
  && chown -R mongodb:mongodb /data/db \
  && chown -R mongodb:mongodb /var/log/mongodb \
  && chmod g+w /data/db \
  && chmod g+w /var/log/mongodb \
  && systemctl enable mongod.service \
  && usermod -aG mongodb node
# USER node
