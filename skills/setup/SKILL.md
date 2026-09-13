---
name: setup
description: Install Rig on Mac and connect this agent to Rig MCP. Use when the plugin is first enabled, MCP tools 401 or are missing, or the user asks how to link Claude, Cursor, Gemini, Copilot, Codex, or Windsurf to Rig.
---

# Set up Rig

Rig is a Mac app that is the local runtime context engine for AI coding agents. This plugin bundles a **cloud MCP** at `https://api.userig.app/mcp` (OAuth). Full localhost logs, ports, git/db, and hub tools need the **Mac app** open and linked.

## Commerce (hard rules)

- Do not offer checkout, upgrades, plan catalogs, or subscription flows.
- If a Cloud entitlement is missing, say so briefly and optionally point to `https://userig.app/pricing` — never a checkout URL.
- Do not upsell.

## 1. Cloud MCP (this plugin)

`https://api.userig.app/mcp` — Streamable HTTP, OAuth 2.1. On first tool use, complete Rig sign-in in the browser.

If tools 401 or OAuth loops: sign in at `https://api.userig.app/account`, retry the tool, confirm the client supports Streamable HTTP.

Cloud tools: `list_projects`, `get_project`, `get_status`, `get_logs` (limited without the local hub), `get_health`, `who_owns_port`, and `start_project` / `stop_project` / `restart_project` with `confirm: true` (queues to a linked Mac).

Client config shapes (do not mix them up):

| Client | File | Shape |
| --- | --- | --- |
| Cursor | `~/.cursor/mcp.json` | `mcpServers.rig.url` |
| Claude Code | `~/.claude.json` | `type: "http"`, `url` |
| VS Code | `.vscode/mcp.json` | `servers` (not `mcpServers`) |
| Windsurf | `~/.codeium/windsurf/mcp_config.json` | `serverUrl` (not `url`) |
| Gemini CLI | extension or `gemini mcp add --transport http` | `httpUrl` |
| Codex | `codex mcp add rig --url …` | URL |

Do not invent a second cloud URL or an OAuth client ID. Prefer the plugin / extension install, or Rig → Connections → **Link**.

## 2. Local hub (full tool surface)

1. Download Rig from `https://userig.app/download`.
2. Open Rig, finish first-run, leave it running.
3. **Connections** → start the MCP hub → **Link** this agent.
4. Restart the agent session if it only reads config on launch.

The local hub is loopback (typically `http://127.0.0.1:47823/mcp` — use the value Rig shows). If tools 401, rotate the token in Connections and re-link.

## Verify

Ask: “list my Rig projects” or “what’s running in Rig?”
