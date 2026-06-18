#!/usr/bin/env bash
# Start a disposable PostgreSQL instance for tests.
# Reuses an existing container if it is already running.
set -euo pipefail

NAME="agentic-kit-test-pg"
PORT="${PG_TEST_PORT:-55432}"
PASSWORD="test"
USER="test"
DB="test"
IMAGE="postgres:16"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required but not found on PATH" >&2
  exit 1
fi

if docker ps --format '{{.Names}}' | grep -q "^${NAME}$"; then
  echo "Reusing running container ${NAME}"
else
  docker rm -f "${NAME}" >/dev/null 2>&1 || true
  echo "Starting ${IMAGE} as ${NAME} on port ${PORT}..."
  docker run -d --name "${NAME}" \
    -e "POSTGRES_USER=${USER}" \
    -e "POSTGRES_PASSWORD=${PASSWORD}" \
    -e "POSTGRES_DB=${DB}" \
    -p "${PORT}:5432" \
    --health-cmd="pg_isready -U ${USER}" \
    --health-interval=2s --health-timeout=2s --health-retries=15 \
    "${IMAGE}" >/dev/null
fi

echo -n "Waiting for Postgres to be ready"
for _ in $(seq 1 30); do
  if docker exec "${NAME}" pg_isready -U "${USER}" >/dev/null 2>&1; then
    echo " ready."
    echo "TEST_DATABASE_URL=postgres://${USER}:${PASSWORD}@localhost:${PORT}/${DB}"
    exit 0
  fi
  echo -n "."
  sleep 1
done

echo " timed out waiting for Postgres" >&2
exit 1
