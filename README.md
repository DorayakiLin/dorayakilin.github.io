# Tao Lin Academic Website

Personal academic website scaffolded from [`al-folio`](https://github.com/alshedivat/al-folio) and customized for a young researcher style.

## What Is Ready

- Home page with Tao Lin identity and Embodied AI focus
- Publications page driven by local BibTeX entries
- Minimal project pages aligned with current research themes
- CV placeholder page
- GitHub Pages deployment workflow

## Repository Naming For GitHub Pages

For the simplest personal-site deployment, create a GitHub repository named:

- `dorayakilin.github.io`

Then push the contents of this directory into that repository.

## Required Edits Before First Public Release

1. In [`_config.yml`](_config.yml), confirm:
   - `url: https://dorayakilin.github.io`
2. Keep:
   - `baseurl:`

For a personal GitHub Pages site, `baseurl` should stay empty.

## Recommended Publish Flow

1. Create a GitHub repository named `YOUR_GITHUB_USERNAME.github.io`
2. Push this directory to that repository's `main` branch
3. In GitHub, open `Settings -> Actions -> General`
4. Give GitHub Actions `Read and write permissions`
5. Push once to trigger the existing deploy workflow
6. In `Settings -> Pages`, set the source branch to `gh-pages`

After that, the site should publish at:

- `https://dorayakilin.github.io`

## Content Source For Version 1

The first version is seeded from the public Google Scholar profile:

- <https://scholar.google.com/citations?user=EfsjpFAAAAAJ&hl=zh-CN&authuser=1>

## Placeholders Still In Use

- No portrait image yet
- No public CV PDF yet
- No public email yet
- No GitHub profile link yet
- Publications are seeded from currently visible public Scholar entries and can be expanded later

## Local Development Notes

This template currently expects a newer Ruby toolchain than the system Ruby available in this workspace.

Observed local environment on 2026-04-03:

- Ruby: `2.6.10`
- Required Bundler from `Gemfile.lock`: `4.0.4`
- Bundler `4.0.4` requires Ruby `>= 3.2.0`

Because of that mismatch, local `bundle exec jekyll build` was not completed in this environment.

Recommended preview paths:

1. Use GitHub Actions deployment directly
2. Use Docker if available, following [`INSTALL.md`](INSTALL.md)
3. Use a newer Ruby version via `rbenv` or another Ruby manager
