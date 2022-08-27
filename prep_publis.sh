#!/usr/bin/env bash

# format dart files
dart format .

# execute dry run publish
dart pub publish --dry-run

