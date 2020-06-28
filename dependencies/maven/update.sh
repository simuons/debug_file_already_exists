#!/bin/bash

# Updating the dependencies based on dependencies.yaml.

MONO_REPO_HOME=$(cd "$(dirname "${path}")" && pwd -P)/../../

pushd "$MONO_REPO_HOME" > /dev/null
pwd

bazel run //dependencies/maven:bazel-deps generate -- --repo-root $MONO_REPO_HOME --sha-file dependencies/maven/dependencies.bzl --deps dependencies/maven/dependencies.yaml

popd > /dev/null
