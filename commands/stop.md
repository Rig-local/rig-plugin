---
description: Stop a Rig-managed project (requires confirm)
argument-hint: [project name or id]
---

Stop the Rig-managed project: **$ARGUMENTS**

1. Resolve the project with `list_projects` / `get_project` if the name is ambiguous.
2. Call `stop_project` with `confirm: true` only after the user agrees to stop it. This is destructive: it interrupts that service until started again.
3. Without `confirm: true`, the tool must refuse — do not retry with confirm unless the user agreed.

If tools are missing or return 401, follow the setup skill. Do not `kill` processes in the terminal as a substitute when Rig is connected.
