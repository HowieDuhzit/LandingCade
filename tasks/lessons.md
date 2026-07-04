# Lessons

- Coolify can run Docker BuildKit checks as hard build failures. Rails-generated Dockerfiles that use `SECRET_KEY_BASE_DUMMY=1` for asset precompilation can trip the `SecretsUsedInArgOrEnv` linter even though it is a dummy value. For Coolify Rails deploys, skip that specific Dockerfile check instead of leaving `# check=error=true`.
- Bundler 4 deployment/frozen mode requires non-empty lockfile checksums. If Coolify fails during `bundle install` with `Your lockfile has an empty CHECKSUMS entry`, run `bundle lock --add-checksums`, commit the updated `Gemfile.lock`, and verify with an actual Docker build step.
