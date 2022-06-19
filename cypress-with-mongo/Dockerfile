FROM cypress/included:10.1.0

RUN apt-get update && apt-get install --no-install-recommends -y git openssh-server gnupg curl wget ca-certificates lsb-release; \
  update-ca-certificates; \
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -; \
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list; \
  apt-get update && apt-get install --no-install-recommends -y mongodb-org mongodb-org-tools; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /data/db
