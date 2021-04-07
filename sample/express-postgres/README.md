# Express.js + Postgres sample

This is a sample application that connects to Postgresql database. It is designed to run in GKE and connect to Cloud SQL.

---

# 1. Create `psql.env`

Create file by changing filename of `psql-sample.env` to `psql.env`. Edit file providing Postgresql connection parameters.

# 2. Build & run container

```bash
$ docker build -t express-postgres:latest .
$ docker run -d -p 8080:8080 --env-file psql.env express-postgres:latest
```

# 3. Publish container to Docker Hub

```bash
$ docker login
# docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
$ docker tag express-postgres macborowy/express-postgres
# docker push TARGET_IMAGE[:TAG]
$ docker push macborowy/express-postgres:latest
```
