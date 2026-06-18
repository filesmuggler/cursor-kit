---
name: db-test-harness
description: Run automated tests against an ephemeral PostgreSQL database, spinning one up via Docker or Testcontainers when none is available. Use when writing or running database-backed tests.
---

# DB Test Harness

Run DB tests against a real, disposable PostgreSQL instance - never against a shared or production database.

## Workflow

```
- [ ] 1. Ensure a test Postgres is available (reuse if running, else spin up)
- [ ] 2. Apply migrations to the test DB
- [ ] 3. Run the test suite against it
- [ ] 4. Tear down / reset between runs
```

## Spin up a local Postgres

If `DATABASE_URL` for tests is not already reachable, start an ephemeral instance:

```bash
scripts/pg-up.sh   # starts a disposable Postgres on port 55432
```

Then point tests at it (the script prints the URL), apply migrations, and run tests:

```bash
export TEST_DATABASE_URL=postgres://test:test@localhost:55432/test
npx drizzle-kit migrate
npm test
```

## Testcontainers (preferred in CI / per-suite isolation)
Use Testcontainers to manage the lifecycle inside the test process so each run gets a clean DB:

```ts
const pg = await new PostgreSqlContainer("postgres:16").start();
process.env.TEST_DATABASE_URL = pg.getConnectionUri();
// run migrations, then tests; container stops on teardown
```

## Rules
- Tests must be hermetic: seed their own data and clean up (truncate or transaction-rollback per test).
- Never run destructive tests against a non-test database. Guard on the URL/host.

See `scripts/pg-up.sh` for the Docker spin-up helper.
