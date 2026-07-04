# LandingCade Task Plan

## Checklist

- [x] Inspect workspace and confirm Rails toolchain.
- [x] Scaffold a minimal Rails application in the current empty workspace.
- [x] Add persistent models for games and page settings.
- [x] Add a simple admin login.
- [x] Add admin controls for adding/editing/removing games.
- [x] Add admin controls for editing generic page branding and boot-menu copy.
- [x] Build the public arcade boot-menu landing page with game links.
- [x] Keep the implementation easy to rebrand and easy to extend.
- [x] Verify database setup, tests, and local server boot.

## Review

- Generated a Rails 8.1 app with SQLite persistence.
- Added `Game` and `SiteSetting` models for menu links and rebrandable page settings.
- Added session-based admin login at `/admin/login`; use `ADMIN_PASSWORD` or local fallback `arcade-admin`.
- Added admin dashboard, game CRUD, settings edit form, and a retro CRT boot-menu public root page.
- Seeded three generic placeholder games.
- Verification passed: `bin/rails db:prepare`, `bin/rails db:seed`, `bin/rails test`.
- Local server verified booting on `http://127.0.0.1:3001`; `HEAD /` and `HEAD /admin/login` returned HTTP 200. Sandbox GET checks were inconsistent, but integration tests rendered the full pages successfully.

## Coolify Publish Plan

- [x] Inspect Dockerfile, entrypoint, ignore rules, and GitHub CLI auth.
- [x] Add Coolify Docker Compose config with persistent SQLite storage.
- [x] Add production env example and README deployment notes.
- [x] Validate Rails tests and Compose config.
- [x] Initialize Git repository, commit, create GitHub repo, and push.

## Coolify Publish Review

- Added `compose.yaml` for Coolify with a single Rails service, persistent `arcade_storage` volume, `/up` healthcheck, and required `SECRET_KEY_BASE`/`ADMIN_PASSWORD` env vars.
- Added `.env.coolify.example` and README Coolify deployment notes.
- Changed admin login to use `ADMIN_PASSWORD` directly so production deploys do not require `config/master.key`.
- Verification passed: `bin/rails test` and `SECRET_KEY_BASE=testsecret ADMIN_PASSWORD=testpassword docker compose -f compose.yaml config`.
- Created GitHub repo and pushed `main`: https://github.com/HowieDuhzit/LandingCade

## Coolify Build Fix

- [x] Captured the BuildKit lint failure lesson.
- [x] Changed Dockerfile lint directive to skip `SecretsUsedInArgOrEnv`, which falsely flags Rails' `SECRET_KEY_BASE_DUMMY=1` asset precompile workaround.
- [x] Re-run tests and compose validation.
- [x] Commit and push the fix.
