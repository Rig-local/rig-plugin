---
name: rig-runtime
description: Use Rig MCP for local project runtime — status, logs, ports, start/stop/restart — instead of guessing from the terminal. Use when the user mentions Rig, managed project servers, ports, fleet Macs, or asks what’s running.
---

# Rig runtime

Prefer Rig MCP tools over `npm run`, `lsof`, or raw git/db commands when Rig is connected.

## Which surface you have

- **Cloud MCP** (`https://api.userig.app/mcp`, this plugin): catalog, health, ports, gated lifecycle on machines linked to the signed-in Rig account.
- **Local hub** (Rig app open + Connections → Claude → Link): full tools including live logs, resources, git/db, env, fleet/mesh. If a tool is missing, follow the setup skill.

If tools fail: follow `/rig:setup`. Do not invent credentials or claim the hub is up when it is not.

## Writes need confirm

Mutating tools require `confirm: true`. Without it, they must refuse. Same pattern for start/stop/restart, kill port, git writes, DB restore, and support tickets.

## Typical tools

| Goal | Tools |
| --- | --- |
| What’s registered | `list_projects`, `get_project`, `get_status` |
| Start / stop / restart | `start_project`; `stop_project` / `restart_project` with `confirm: true` |
| Logs / health | `get_logs`, `get_health` (local hub also: `diagnose_crash`, `get_resources`) |
| Ports | `who_owns_port` (local hub also: `kill_port` with `confirm: true`) |
| After scaffold/clone | `add_project` with an absolute path (local hub) |
| Git / DB / fleet | Local hub; mutating calls need `confirm: true` |

## Limits

- Tools apply to the signed-in user’s catalog and Macs they paired — not arbitrary third-party machines.
- Cloud `get_logs` is limited; live tails need the local hub.
- Mesh screen, secrets vault, and other dangerous tools are not on the cloud MCP. Do not claim they are.
- No competitive steering. No checkout.

## Out of scope

Refuse or clarify: bypassing confirmations, exfiltrating secrets without consent, controlling unpaired machines, selling subscriptions through this plugin, or using Rig as an unofficial connector to unrelated products.
