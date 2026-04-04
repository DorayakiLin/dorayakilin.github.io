# Contact Popup Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a homepage contact popup button that reveals obfuscated contact information next to the existing CV button.

**Architecture:** Store the contact content in the about page frontmatter, render it from the about layout, and use a native disclosure pattern for the popup so the interaction stays lightweight and dependency-free. Extend the existing smoke test to cover both the content and the layout hook.

**Tech Stack:** Jekyll, Liquid, Markdown frontmatter, SCSS, shell smoke test

---

### Task 1: Add the failing smoke assertions

**Files:**
- Modify: `tests/site_content_smoke.sh`

**Step 1: Write the failing test**

Add assertions for the obfuscated email string and the contact popup markup class.

**Step 2: Run test to verify it fails**

Run: `./tests/site_content_smoke.sh`
Expected: FAIL because the contact content is not present yet.

### Task 2: Add the content and markup

**Files:**
- Modify: `_pages/about.md`
- Modify: `_layouts/about.liquid`

**Step 1: Add minimal content**

Add a `contact` block to the about page frontmatter with the obfuscated email and short note.

**Step 2: Render the popup trigger and content**

Add a third profile action that toggles a popup card containing the contact information.

### Task 3: Style and verify

**Files:**
- Modify: `_sass/_layout.scss`

**Step 1: Add minimal styling**

Style the disclosure trigger and popup so they align with the existing circular profile actions and remain usable on mobile.

**Step 2: Run verification**

Run: `./tests/site_content_smoke.sh`
Expected: PASS

Run: `npx prettier --check _layouts/about.liquid _pages/about.md _sass/_layout.scss tests/site_content_smoke.sh docs/plans/2026-04-04-contact-popup-design.md docs/plans/2026-04-04-contact-popup.md`
Expected: all files match Prettier formatting.
