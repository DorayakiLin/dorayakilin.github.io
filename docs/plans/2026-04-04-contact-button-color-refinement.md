# Contact Button Color Refinement Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Make the homepage CV text and mail icon match the Google Scholar accent color while reducing the mail icon size.

**Architecture:** Keep the existing homepage profile action structure unchanged and limit the change to CSS. Reuse the existing theme accent color for visual consistency and scope the icon size reduction to the mail button only.

**Tech Stack:** SCSS, Jekyll

---

### Task 1: Refine profile action styling

**Files:**
- Modify: `_sass/_layout.scss`

**Step 1: Add the failing test**

Use targeted source checks that fail if the contact toggle still uses text-color styling or if the mail icon does not have a smaller dedicated size rule.

**Step 2: Run test to verify it fails**

Run: `sh -c 'grep -Fq ".profile-contact-toggle i" _sass/_layout.scss && grep -Fq "color: var(--global-theme-color);" _sass/_layout.scss'`
Expected: FAIL before the style change if the dedicated icon rule is missing.

**Step 3: Write minimal implementation**

Update the profile action styles so the CV label and mail icon use `var(--global-theme-color)` and the mail icon gets a smaller font size.

**Step 4: Run test to verify it passes**

Run: `sh -c 'grep -Fq ".profile-contact-toggle i" _sass/_layout.scss && grep -Fq "color: var(--global-theme-color);" _sass/_layout.scss'`
Expected: PASS

**Step 5: Commit**

```bash
git add _sass/_layout.scss docs/plans/2026-04-04-contact-button-color-refinement.md
git commit -m "fix: tune homepage action colors"
```
