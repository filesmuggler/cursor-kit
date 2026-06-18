---
name: ui-qa
description: Verify UI changes in React, Next.js, and Expo apps through visual, responsive, accessibility, and form testing across device sizes. Use after changing components, layouts, styles, or forms.
---

# UI QA

Verify UI changes beyond "it compiles". Cover visual, responsive, accessibility, and form behavior.

## Checklist

```
- [ ] Visual: renders correctly in light and dark; matches the intended design
- [ ] Responsive: mobile, tablet, desktop breakpoints; no overflow or clipping
- [ ] Accessibility: semantic roles, labels, focus order, contrast, keyboard nav
- [ ] Forms: validation, error states, disabled/submitting states, success path
- [ ] States: loading, empty, error, and populated
```

## How to test

- Component tests: React Testing Library + jest/vitest. Query by role/label, assert behavior and a11y, not implementation details.

```tsx
render(<LoginForm />);
await userEvent.type(screen.getByLabelText(/email/i), "bad");
await userEvent.click(screen.getByRole("button", { name: /sign in/i }));
expect(screen.getByRole("alert")).toHaveTextContent(/valid email/i);
```

- Responsive / visual: exercise breakpoints (e.g. Playwright viewports, or a browser tool) and capture screenshots for review.
- Accessibility: run an automated audit (e.g. `axe`) and fix violations; verify keyboard-only navigation reaches all controls.
- Expo / React Native: test on iOS and Android targets; use accessibility props (`accessibilityLabel`, `accessibilityRole`).

Report which device sizes and states were checked and any issues found.
