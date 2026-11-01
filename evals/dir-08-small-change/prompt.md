---
max_turns: 12
allowed_tools: [Read, Glob, Grep, Skill]
---

Add a 'Dark mode' toggle row to the existing Appearance section of our settings screen. Here's the current section:

```tsx
import { Switch } from '@/components/Switch';
import { SettingsRow } from '@/components/SettingsRow';

export function AppearanceSection({ prefs, setPref }) {
  return (
    <section aria-labelledby="appearance">
      <h2 id="appearance">Appearance</h2>
      <SettingsRow label="Reduce motion" hint="Minimise animations">
        <Switch checked={prefs.reduceMotion} onCheckedChange={(v) => setPref('reduceMotion', v)} />
      </SettingsRow>
    </section>
  );
}
```
