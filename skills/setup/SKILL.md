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

`https://api.userig.app/mcp` — Streamable HTTP. The host signs the user in with OAuth in the browser on first tool use.

Do not read API keys, account tokens, or bearer tokens from the environment, shell profile, or MCP config files, and do not copy a local hub credential into a request. If a client cannot use OAuth, the user types an account PAT into the plugin option `rig_account_pat` (`userConfig`, `sensitive: true`). That value is sent only as the `Authorization` header to `https://api.userig.app/mcp`. Leave the option blank to keep browser OAuth. Never ask for or forward the local hub token.

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

Prefer the plugin or extension install. Do not invent a second cloud URL or an OAuth client ID, and do not open the user’s MCP config files (they can hold credentials). Field names differ by client: Cursor uses `mcpServers.rig.url`, Claude Code uses `type: "http"` plus `url`, VS Code uses `servers`, Windsurf uses `serverUrl`, Gemini CLI uses `httpUrl`. Codex and Grok Build take the same HTTPS URL.

## 2. Local hub (full tool surface)

1. Download Rig from `https://userig.app/download`.
2. Open Rig, finish first-run, leave it running.
3. **Connections** → start the MCP hub → **Link** this agent.
4. Restart the agent session if it only picks up MCP servers at launch.

The local hub is loopback (the URL Rig shows, often `http://127.0.0.1:47823/mcp`). The user links this agent from Connections. Do not read, copy, or forward that hub credential. If tools 401, the user re-links from Connections.

## Verify

Ask: “list my Rig projects” or “what’s running in Rig?”
