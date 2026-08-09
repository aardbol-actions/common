# AI Agent Guide

This document helps AI coding agents understand and work with this repository effectively.

## Repository Overview

This is the aardbol fork of the [Red Hat GitHub Actions](https://github.com/redhat-actions) `common` monorepo. It provides shared GitHub Actions and configuration used by the `aardbol-actions` organization. It contains several components that are independently developed but share a common repository.

This fork tracks upstream `redhat-actions/common`, pulling in upstream fixes and features while keeping aardbol-specific package names, security files, and CI configuration.

## Components

### action-io-generator (`./action-io-generator/`)

An npm package and Docker-based GitHub Action that reads an `action.yml` file and generates TypeScript enums for its inputs and outputs.

- **Language:** TypeScript
- **Bundler:** Webpack (shared config from `config-files/webpack`)
- **Entry point:** `src/index.ts` (library), `bin.js` (CLI)
- **Key commands:**
  ```sh
  cd action-io-generator
  npm ci
  npm run lint          # ESLint with --max-warnings=0
  npm run compile       # tsc -p .
  npm run bundle        # Webpack production build + copy bin.js to dist/
  npm test              # Vitest (test/generator.test.ts)
  ```
- **Important:** The `dist/` directory is committed. After source changes, run `npm run bundle` and commit the updated dist.

### bundle-verifier (`./bundle-verifier/`)

A JavaScript GitHub Action that verifies a committed distribution bundle matches a fresh build from source.

- **Language:** TypeScript
- **Bundler:** `@vercel/ncc`
- **Runtime:** Node.js (specified in `action.yml` `runs.using`)
- **Key commands:**
  ```sh
  cd bundle-verifier
  npm ci
  npm run compile       # tsc -p .
  npm run bundle        # ncc build src/index.ts --source-map --minify
  ```
- **Important:** The `dist/` directory is committed. After source changes, run `npm run bundle` and commit the updated dist.

### commit-data (`./commit-data/`)

A Docker-based GitHub Action that extracts commonly needed data about the HEAD commit (branch, SHA, tags, PR info).

- **Language:** Shell (bash)
- **Container:** Alpine Linux with git and bash
- **Entry point:** `entrypoint.sh`
- **No build step required** — changes to `entrypoint.sh` or `Dockerfile` take effect directly.
- **Outputs are set via:** `echo "name=value" >> "$GITHUB_OUTPUT"`

### podman-entitlement (`./podman-entitlement/`)

A composite Action which enables subsequent rootless `podman build`s to consume Red Hat entitlements. Mirrored from upstream.

### config-files (`./config-files/`)

Shared npm configuration packages — published under the `@aardbol-actions` scope in this fork:

| Package | Purpose |
|---------|---------|
| `@aardbol-actions/tsconfig` | Base TypeScript configuration |
| `@aardbol-actions/eslint-config` | ESLint rules (extends airbnb-base + typescript-eslint) |
| `@aardbol-actions/webpack-config` | Webpack 5 config factory for bundling actions |

These are published to npm and have downstream consumers. Changes here affect all repos that depend on them.

## Code Conventions

- **TypeScript strict mode** is enabled across all components
- **4-space indentation**, double quotes, 120-character max line length
- **Stroustrup brace style** (`else` on new line)
- **ESLint** with `@aardbol-actions/eslint-config` — run with `--max-warnings=0`
- **No default exports** — use named exports
- **Explicit return types** on functions

## CI Workflows

Located in `.github/workflows/`:

| Workflow | What it tests |
|----------|---------------|
| `ci-action-io-generator.yml` | Lint, bundle verification, compile + Vitest |
| `ci-commit-data.yml` | Runs the commit-data action and echoes outputs |
| `verify-verifier.yml` | Bundle-verifier verifies its own dist is current |
| `codeql-analysis.yml`, `trivy-scan.yml`, `scorecards.yml`, `link_check.yml` | Security and dependency scanning |

## Making Changes

1. **Source changes to actions:** Edit TypeScript source, then run `npm run bundle` to regenerate `dist/`. Commit both source and dist changes together.
2. **Config file changes:** Edit the config, bump the version in `package.json`. Consider impact on downstream consumers.
3. **Shell script changes (commit-data):** Edit `entrypoint.sh` directly. Ensure POSIX compatibility is not required (the script uses bash).
4. **Workflow changes:** Edit YAML files in `.github/workflows/`. Use pinned runner versions (e.g. `ubuntu-24.04`) and pin actions by commit SHA with a version comment.
5. **Upstream sync:** This fork tracks upstream. Use `git fetch upstream main` and merge/changes carefully, keeping aardbol package names and security files.

## Testing

Verification is done through:
- `npm run lint` — static analysis
- `npm run compile` — type checking
- `npm run bundle` — confirms the code bundles successfully
- `npm test` — Vitest unit tests (action-io-generator, bundle-verifier)
- CI workflows — end-to-end verification via GitHub Actions