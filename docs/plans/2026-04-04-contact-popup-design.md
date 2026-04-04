# Contact Popup Design

## Goal
Add a third circular contact button next to the existing Scholar and CV buttons on the homepage profile card, opening a small contact popup with an obfuscated email address.

## Approved Approach
Use a lightweight inline popup below the button row. The popup opens on click, matches the existing profile button style, and avoids direct `mailto:` exposure.

## Key Decisions
- Keep the existing homepage profile layout intact.
- Add a dedicated contact trigger beside `CV`.
- Display the email as `taolin200108 [at] gmail [dot] com`.
- Do not create a clickable email link.
- Keep the implementation local to the about page layout and profile styles.

## Testing
- Extend the existing smoke test to assert the obfuscated email content and the contact popup markup hook.
