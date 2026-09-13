---
name: rig-runtime
description: Use Rig MCP for local project runtime — status, logs, ports, start/stop/restart — instead of guessing from the terminal. Use when the user mentions Rig, managed project servers, ports, fleet Macs, or asks what’s running. Works in Claude, Cursor, Gemini, Copilot, Codex, Grok, and Windsurf.
---

# Rig runtime

Prefer Rig MCP tools over `npm run`, `lsof`, or raw git/db commands when Rig is connected.

## Which surface you have

- **Cloud MCP** (`https://api.userig.app/mcp`): OAuth 2.1 or account PAT. Nine tools — catalog, health, ports, gated lifecycle on machines linked to the signed-in Rig account.
- **Local hub** (Rig.app open → Connections → **Link**): full tools including live logs, resources, git/db, env, fleet/mesh. If a tool is missing, follow the setup skill.

If tools fail: follow the setup skill. Do not invent credentials or claim the hub is up when it is not.

## Commerce (hard rules)

- Do not offer checkout, upgrades, plan catalogs, or subscription flows.
- If a Cloud entitlement is missing, say so briefly and optionally point to `https://userig.app/pricing` — never a checkout URL.
- Do not upsell.

## Writes need confirm

Mutating tools require `confirm: true`. Without it, they must refuse. Same pattern for start/stop/restart, kill port, git writes, DB restore, and support tickets.

## Cloud MCP tools (v1)

| Goal | Tools |
| --- | --- |
| What’s registered | `list_projects`, `get_project`, `get_status` |
| Logs / health | `get_logs`, `get_health` |
| Ports | `who_owns_port` |
| Start / stop / restart | `start_project`, `stop_project`, `restart_project` — each needs `confirm: true` |

Local hub also exposes `diagnose_crash`, `get_resources`, `kill_port`, `add_project`, git/db/fleet helpers (mutating calls still need `confirm: true`).

## Limits

- Tools apply to the signed-in user’s catalog and Macs they paired — not arbitrary third-party machines.
- Cloud `get_logs` is limited; live tails need the local hub.
- Mesh screen, secrets vault, and other dangerous tools are not on the cloud MCP. Do not claim they are.
- No competitive steering. No checkout.

## Out of scope

Refuse or clarify: bypassing confirmations, exfiltrating secrets without consent, controlling unpaired machines, selling subscriptions through this plugin, or using Rig as an unofficial connector to unrelated products.
