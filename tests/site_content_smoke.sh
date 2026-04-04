#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

CONFIG="$ROOT_DIR/_config.yml"
ABOUT="$ROOT_DIR/_pages/about.md"
ABOUT_LAYOUT="$ROOT_DIR/_layouts/about.liquid"
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
assert_contains "$CONFIG" "url: https://dorayakilin.github.io" "config should include the production GitHub Pages url"
assert_contains "$CONFIG" "baseurl:" "config should keep an explicit empty baseurl for a personal GitHub Pages site"
assert_contains "$CONFIG" "last_name: [Lin]" "Jekyll Scholar should identify Tao Lin as the author"
assert_contains "$ROOT_DIR/.github/workflows/deploy.yml" "touch _site/.nojekyll" "deploy workflow should create .nojekyll in the published output"
assert_contains "$ABOUT" "Shanghai Jiao Tong University" "about page should mention Shanghai Jiao Tong University"
assert_contains "$ABOUT" "Embodied AI" "about page should mention Embodied AI"
assert_contains "$ABOUT" "tao-lin-profile.jpg" "about page should reference the local portrait file"
assert_contains "$ABOUT" "taolin200108 [at] gmail [dot] com" "about page should include the obfuscated contact email"
assert_contains "$ABOUT_LAYOUT" "profile-contact-menu" "about layout should render the contact popup"
assert_contains "$SOCIALS" "scholar_userid: EfsjpFAAAAAJ" "socials should point to the correct Google Scholar profile"
assert_contains "$ROOT_DIR/README.md" "dorayakilin.github.io" "README should explain the required GitHub Pages repository naming"
assert_contains "$ROOT_DIR/README.md" "assets/img/tao-lin-profile.jpg" "README should explain where to replace the portrait"

assert_contains "$BIB" "Sti-bench: Are mllms ready for precise spatial-temporal world understanding?" "bibliography should include Sti-bench"
assert_contains "$BIB" "Evo-0: Vision-language-action model with implicit spatial understanding" "bibliography should include Evo-0"
assert_contains "$BIB" "Robofac: A comprehensive framework for robotic failure analysis and correction" "bibliography should include RoboFac"
assert_contains "$BIB" "Evo-1: Lightweight vision-language-action model with preserved semantic alignment" "bibliography should include Evo-1"
assert_contains "$BIB" "VLA-Pruner: Temporal-Aware Dual-Level Visual Token Pruning for Efficient Vision-Language-Action Inference" "bibliography should include VLA-Pruner"
assert_contains "$BIB" "preview           = {embodied-ai-placeholder.svg}" "bibliography should assign the shared publication placeholder image"

echo "PASS: site content smoke test"
