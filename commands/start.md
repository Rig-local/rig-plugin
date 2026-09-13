---
description: Start a Rig-managed project (requires confirm)
argument-hint: [project name or id]
---

Start the Rig-managed project: **$ARGUMENTS**

1. Resolve the project with `list_projects` / `get_project` if the name is ambiguous.
2. Call `start_project` with `confirm: true` only after the user agrees to start it.
3. Without `confirm: true`, the tool must refuse — do not retry with confirm unless the user agreed.

If tools are missing or return 401, follow the setup skill. Do not run `npm run` / `bun` in the terminal as a substitute when Rig is connected.
