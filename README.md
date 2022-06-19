# cypress

From https://github.com/dtinth/cypress-docker-novnc, thank you.

## install

```sh
docker compose up -d
```

## usage

Access desktop env using
* http://localhost:8080/vnc.html?autoconnect=true

### cypress-with-mongo

Create `docker-compose.override.yml`

```yaml
# docker-compose.override.yml
services:
  cypress:
    build:
      context: cypress-with-mongo
```

```sh
docker compose up -d

# check mongodb logs
docker compose exec cypress sh
tail -f /var/log/mongodb.log
```
