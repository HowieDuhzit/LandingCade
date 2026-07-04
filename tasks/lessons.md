# Lessons

- Coolify can run Docker BuildKit checks as hard build failures. Rails-generated Dockerfiles that use `SECRET_KEY_BASE_DUMMY=1` for asset precompilation can trip the `SecretsUsedInArgOrEnv` linter even though it is a dummy value. For Coolify Rails deploys, skip that specific Dockerfile check instead of leaving `# check=error=true`.
