# Red Hat Actions Common

[![action-io-generator CI](https://github.com/aardbol/common/workflows/action-io-generator%20CI/badge.svg)](https://github.com/aardbol/common/actions)
[![bundle-verifier CI](https://github.com/aardbol/common/workflows/bundle-verifier%20CI/badge.svg)](https://github.com/aardbol/common/actions)
[![commit-data CI](https://github.com/aardbol/common/workflows/commit-data%20CI/badge.svg)](https://github.com/aardbol/common/actions)

[![Tag](https://img.shields.io/github/v/tag/aardbol/common)](https://github.com/aardbol/common/tags)
[![License](https://img.shields.io/github/license/aardbol/common)](./LICENSE)

This repository contains the common Actions and config files for developing the Red Hat GitHub Actions.

- [action-io-generator](./action-io-generator) is an NPM package and (soon to be) Docker Action that makes sure your JavaScript action uses the same Inputs and Outputs defined in your `action.yml`.
- [bundle-verifier](./bundle-verifier) is a JavaScript Action that makes sure your JavaScript action's committed distribution bundle is up-to-date.
- [commit-data](./commit-data) is a Docker Action that outputs some commonly needed data about the current workflow's HEAD commit.
- [config-files](./config-files) contains our shared TypeScript, ESLint, and Webpack configs.

It is also used for tracking issues that don't fit into another, more specific repository.
