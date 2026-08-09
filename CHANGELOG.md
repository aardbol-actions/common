# common Changelog

## v2.1.0
- Sync with upstream `redhat-actions/common` (v2.1.0).
- Add `--lineWrap` option to `action-io-generator`.
- Bump `js-yaml` to 5.2.2 to fix DoS vulnerability.
- Fix `action-io-generator/entrypoint.sh` to exit 1 when generated enums don't match.
- Harden `commit-data`: `set -euo pipefail`, exec-form ENTRYPOINT, empty `pr_head`/`pr_base` defaults.
- Fix `bundle-verifier` input metadata (bundle_file description, drop stale `dist` default).
- Add `podman-entitlement` composite action, mirrored from upstream.
- Add community files adapted to aardbol: `AGENTS.md`, `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`.
- Add path filters and `actions/setup-node` (Node 24, pinned by SHA) to CI workflows.
- Bump shared `@aardbol-actions/tsconfig` target to es2022.

## v2.0.0
- Update action runtimes to Node24: `bundle-verifier` (node12→node24),
  `action-io-generator` Docker image (node:16-alpine→node:24-alpine),
  `commit-data` Docker image (alpine:3.12→alpine:3.23).
- Migrate ESLint from legacy `.eslintrc.js` to flat config (`eslint.config.js`, ESLint 10).
- Migrate `bundle-verifier` tsconfig to extend `@aardbol-actions/tsconfig`.
- Add Vitest testing framework to `action-io-generator` and `bundle-verifier`.
- Add security scanning: CodeQL, Trivy, OpenSSF Scorecards, Lychee link checker.
- Add Dependabot with grouped PRs for npm and GitHub Actions.
- Add `SECURITY.md`, `.editorconfig`, `.pre-commit-config.yaml`.
- Enable branch protection on `main` with required checks and PR reviews.
- Update CI runners to `ubuntu-24.04` and pin all actions by commit SHA.
- Fix `commit-data/entrypoint.sh`: deprecated `::set-output::` → `$GITHUB_OUTPUT`,
  `tag_count` typo, `#!/bin/sh` → `#!/usr/bin/env bash`.
- Fix `action-io-generator/entrypoint.sh`: exit code overwritten by `set +x`.
- Remove pre-committed `test/generated/inputs-outputs.ts` reference file.

### Dependency bumps
- `action-io-generator`: TypeScript 4→6, eslint 7→10, js-yaml 3→4, webpack-cli 5→7
- `bundle-verifier`: TypeScript 4→6, @actions/core/exec/io 1→3, @vercel/ncc 0.25→0.44
- `config-files/eslint`: peer deps bumped (eslint >=7→>=8, @typescript-eslint >=4→>=7)
- `config-files/tsconfig`: peer dep `typescript >=4.1`→`>=5.0`, TS 6 compat
