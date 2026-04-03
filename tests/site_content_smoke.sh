#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

CONFIG="$ROOT_DIR/_config.yml"
ABOUT="$ROOT_DIR/_pages/about.md"
BIB="$ROOT_DIR/_bibliography/papers.bib"
SOCIALS="$ROOT_DIR/_data/socials.yml"

assert_contains() {
  file="$1"
  pattern="$2"
  label="$3"

  if ! grep -Fq "$pattern" "$file"; then
    echo "FAIL: $label" >&2
    exit 1
  fi
}

assert_contains "$CONFIG" "title: Tao Lin" "site title should be Tao Lin"
assert_contains "$CONFIG" "first_name: Tao" "first name should be Tao"
assert_contains "$CONFIG" "last_name: Lin" "last name should be Lin"
assert_contains "$CONFIG" "url: https://YOUR_GITHUB_USERNAME.github.io" "config should include a GitHub Pages url placeholder"
assert_contains "$CONFIG" "baseurl:" "config should keep an explicit empty baseurl for a personal GitHub Pages site"
assert_contains "$ABOUT" "Imperial College London" "about page should mention Imperial College London"
assert_contains "$ABOUT" "Embodied AI" "about page should mention Embodied AI"
assert_contains "$SOCIALS" "scholar_userid: EfsjpFAAAAAJ" "socials should point to the correct Google Scholar profile"
assert_contains "$ROOT_DIR/README.md" "YOUR_GITHUB_USERNAME.github.io" "README should explain the required GitHub Pages repository naming"

assert_contains "$BIB" "Sti-bench: Are mllms ready for precise spatial-temporal world understanding?" "bibliography should include Sti-bench"
assert_contains "$BIB" "Evo-0: Vision-language-action model with implicit spatial understanding" "bibliography should include Evo-0"
assert_contains "$BIB" "Robofac: A comprehensive framework for robotic failure analysis and correction" "bibliography should include RoboFac"
assert_contains "$BIB" "Evo-1: Lightweight vision-language-action model with preserved semantic alignment" "bibliography should include Evo-1"
assert_contains "$BIB" "VLA-Pruner: Temporal-Aware Dual-Level Visual Token Pruning for Efficient Vision-Language-Action Inference" "bibliography should include VLA-Pruner"

echo "PASS: site content smoke test"
