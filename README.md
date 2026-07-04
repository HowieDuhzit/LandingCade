# LandingCade

LandingCade is a generic, rebrandable Rails arcade landing page starter. The public
root page behaves like a retro game boot menu, and every game entry is just a
link to another page or app. The seeded page identity is intentionally generic:
`Arcade Menu`.

## Setup

```sh
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

The development server defaults to `http://127.0.0.1:3000`. If that port is in
use, run `bin/rails server -p 3001`.

## Admin

Visit `/admin/login`.

Set `ADMIN_PASSWORD` before running in production. If no credential is set, the
local fallback password is:

```text
arcade-admin
```

The admin console can:

- Add, edit, publish, hide, reorder, and delete game links.
- Edit the generic site name, headline, footer copy, and menu colors.
- Preview the current boot-menu configuration from the dashboard.

## Coolify Deploy

Use `compose.yaml` in Coolify as a Docker Compose application. Add these
environment variables in Coolify before deploying:

```text
SECRET_KEY_BASE=<output from bin/rails secret>
ADMIN_PASSWORD=<your admin login password>
```

The service listens on container port `80`, stores SQLite databases in the
named `arcade_storage` volume, and exposes `/up` for health checks. The Rails
entrypoint runs `bin/rails db:prepare` automatically when the server starts.

## Rebranding

Use the admin settings form for copy and colors. The app intentionally keeps
branding data in `SiteSetting` and game entries in `Game`, so a new arcade can
be created without changing code.

## Tests

```sh
bin/rails test
```
