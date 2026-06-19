# Pipeline Demo

Simple demo that shows a Dockerized frontend and MySQL service with a sample Jenkins pipeline.

Project layout

- `docker-compose.yml` — compose file that starts the app stack
- `Jenkinsfile` — example pipeline configuration for CI
- `frontend/` — static frontend and its `Dockerfile`
- `mysql/` — MySQL image bits and `init.sql` for initial data

Prerequisites

- Docker
- Docker Compose (v1 or v2)
- (Optional) Jenkins to run the `Jenkinsfile`

Quick start (development)

From the project root run:

```bash
docker-compose up --build
```

Run detached:

```bash
docker-compose up -d --build
```

Stop and remove containers:

```bash
docker-compose down
```

Build images manually

```bash
docker build -t pipelinedemo-frontend ./frontend
docker build -t pipelinedemo-mysql ./mysql
```

Environment

- This repo expects any sensitive values (passwords, API keys) to be provided via environment variables or a local `.env` file. `.env` is included in `.gitignore` to avoid accidental commits.
- Example `.env` values:

```env
MYSQL_ROOT_PASSWORD=change_me
MYSQL_DATABASE=app_db
MYSQL_USER=app
MYSQL_PASSWORD=change_me
FRONTEND_PORT=80
```

Notes

- The MySQL initialization SQL is in `mysql/init.sql`. The Dockerfile in `mysql/` uses that to seed the database.
- The frontend is a static single-file site at `frontend/index.html` built and served by its `Dockerfile`.
- `Jenkinsfile` contains a simple pipeline example — configure a Jenkins job to use this repository to run it.

Editing

- To change the frontend edit `frontend/index.html` and rebuild the `frontend` image.
- To change database initialization edit `mysql/init.sql`.

Need help?

Tell me if you want me to commit this file, create a `.env.example`, or wire a basic `docker-compose.override.yml` for local development.
