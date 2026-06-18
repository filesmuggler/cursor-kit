---
name: analytics-setup
description: Wire up product analytics and feature flags (PostHog) in React, Next.js, or Expo apps, including event capture and flag gating. Use when adding analytics, event tracking, or feature flags.
---

# Analytics Setup (PostHog + Feature Flags)

Add analytics and feature flags consistently and privately.

## Setup
- Install the appropriate SDK: `posthog-js` (web), `posthog-react-native` (Expo/RN), `posthog-node` (server).
- Initialize once at the app root via a provider. Read the API key and host from environment variables - never hardcode keys.

```tsx
// app/providers.tsx (Next.js)
posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY!, {
  api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST,
});
```

## Events
- Use a small typed wrapper so event names and properties are consistent and discoverable.
- Name events `object_action` (e.g. `checkout_completed`). Capture only the properties you need; avoid PII.

## Feature flags
- Gate features behind a flag check; provide a safe default for when flags have not loaded.

```tsx
const enabled = useFeatureFlagEnabled("new-checkout") ?? false;
return enabled ? <NewCheckout /> : <Checkout />;
```

## Privacy
- Respect consent. Mask sensitive inputs in session capture. Confirm what is being sent before enabling autocapture.
