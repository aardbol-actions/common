# Red Hat Actions Common

[![action-io-generator CI](https://github.com/aardbol-actions/common/actions/workflows/ci-action-io-generator.yml/badge.svg)](https://github.com/aardbol-actions/common/actions/workflows/ci-action-io-generator.yml)
[![bundle-verifier CI](https://github.com/aardbol-actions/common/actions/workflows/verify-verifier.yml/badge.svg)](https://github.com/aardbol-actions/common/actions/workflows/verify-verifier.yml)
[![commit-data CI](https://github.com/aardbol-actions/common/actions/workflows/ci-commit-data.yml/badge.svg)](https://github.com/aardbol-actions/common/actions/workflows/ci-commit-data.yml)
[![CodeQL](https://github.com/aardbol-actions/common/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/aardbol-actions/common/actions/workflows/codeql-analysis.yml)
[![Trivy](https://github.com/aardbol-actions/common/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/aardbol-actions/common/actions/workflows/trivy-scan.yml)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/aardbol-actions/common/badge)](https://securityscorecards.dev/viewer/?uri=github.com/aardbol-actions/common)

[![Tag](https://img.shields.io/github/v/tag/aardbol-actions/common)](https://github.com/aardbol-actions/common/tags)
[![License](https://img.shields.io/github/license/aardbol-actions/common)](./LICENSE)

This repository contains the common Actions and config files for developing the Red Hat GitHub Actions. This repository has been forked to implement the latest dependency versions and security fixes.

- [action-io-generator](./action-io-generator) is an NPM package and (soon to be) Docker Action that makes sure your JavaScript action uses the same Inputs and Outputs defined in your `action.yml`.
- [bundle-verifier](./bundle-verifier) is a JavaScript Action that makes sure your JavaScript action's committed distribution bundle is up-to-date.
- [commit-data](./commit-data) is a Docker Action that outputs some commonly needed data about the current workflow's HEAD commit.
- [config-files](./config-files) contains our shared TypeScript, ESLint, and Webpack configs.

It is also used for tracking issues that don't fit into another, more specific repository.
