---
name: db-migrations
description: Manage Drizzle/PostgreSQL schema changes - detect schema drift, generate and review migrations, and apply them safely. Use when changing the database schema or when migrations are out of sync.
---

# Database Migrations (Drizzle)

Generate, review, and apply schema changes safely.

## Workflow

```
- [ ] 1. Edit the schema (schema.ts), not the SQL directly
- [ ] 2. Detect drift between schema and database
- [ ] 3. Generate the migration
- [ ] 4. Review the generated SQL
- [ ] 5. Apply to a dev/test DB and verify
- [ ] 6. Confirm before applying anything destructive
```

## Commands

```bash
# Generate migration SQL from schema changes
npx drizzle-kit generate

# Inspect drift between schema and live DB
npx drizzle-kit check
# (or `drizzle-kit push` for prototyping only - not for production)

# Apply migrations
npx drizzle-kit migrate
```

## Reviewing generated SQL
- Read every generated statement before applying. Confirm column types, nullability, defaults, and indexes match intent.
- Flag destructive operations (DROP, ALTER ... TYPE narrowing, NOT NULL on populated columns). For these, propose a backfill/expand-contract strategy instead of a direct change.

## Drift detection
- If the schema and DB disagree, never blindly `push`. Determine the cause (manual change, missed migration) and reconcile with an explicit migration.

## Safety
- Apply to a throwaway/dev DB first and run the test suite. Require explicit confirmation before running destructive migrations against shared environments.
