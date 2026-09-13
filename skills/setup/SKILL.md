---
name: setup
description: Install Rig on Mac and connect this agent to Rig MCP. Use when the plugin is first enabled, MCP tools 401 or are missing, or the user asks how to link Claude, Cursor, Gemini, Copilot, Codex, Grok, or Windsurf to Rig.
---

# Set up Rig

Rig is a Mac app that is the local runtime context engine for AI coding agents. This plugin bundles a **cloud MCP** at `https://api.userig.app/mcp` (OAuth 2.1, Streamable HTTP). Full localhost logs, ports, git/db, and hub tools need the **Mac app** open and linked via Connections → **Link**.

## Commerce (hard rules)

- Do not offer checkout, upgrades, plan catalogs, or subscription flows.
- If a Cloud entitlement is missing, say so briefly and optionally point to `https://userig.app/pricing` — never a checkout URL.
- Do not upsell.

## 1. Cloud MCP (this plugin)

`https://api.userig.app/mcp` — Streamable HTTP, OAuth 2.1 (browser sign-in on first tool use). Signed-in users may also use an account PAT (`rig_at_…` from the dashboard).

If tools 401 or OAuth loops: sign in at `https://api.userig.app/account`, retry the tool, confirm the client supports Streamable HTTP.

Nine cloud tools:

| Tool | Notes |
| --- | --- |
| `list_projects` | Catalog for the signed-in account |
| `get_project` | By id or name |
| `get_status` | Run / presence status |
| `get_logs` | Limited without the local hub |
| `get_health` | Account / device presence |
| `who_owns_port` | Catalog port match |
| `start_project` | Requires `confirm: true`; queues to a linked Mac |
| `stop_project` | Requires `confirm: true` |
| `restart_project` | Requires `confirm: true` |

Client config shapes (do not mix them up):

| Client | File | Shape |
| --- | --- | --- |
| Cursor | `~/.cursor/mcp.json` | `mcpServers.rig.url` |
| Claude Code | `~/.claude.json` | `type: "http"`, `url` |
| VS Code | `.vscode/mcp.json` | `servers` (not `mcpServers`) |
| Windsurf | `~/.codeium/windsurf/mcp_config.json` | `serverUrl` (not `url`) |
| Gemini CLI | extension or `gemini mcp add --transport http` | `httpUrl` |
| Codex | `codex mcp add rig --url …` | URL |
| Grok Build | plugin marketplace / MCP add | same HTTPS URL |

Do not invent a second cloud URL or an OAuth client ID. Prefer the plugin / extension install, or Rig → Connections → **Link**.

## 2. Local hub (full tool surface)

1. Download Rig from `https://userig.app/download`.
2. Open Rig, finish first-run, leave it running.
3. **Connections** → start the MCP hub → **Link** this agent.
4. Restart the agent session if it only reads config on launch.

The local hub is loopback (typically `http://127.0.0.1:47823/mcp` — use the value Rig shows). Prefer **Link** over hand-editing a bearer token. If tools 401, rotate the token in Connections and re-link.

## Verify

Ask: “list my Rig projects” or “what’s running in Rig?”
