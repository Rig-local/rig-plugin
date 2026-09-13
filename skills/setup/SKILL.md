---
name: setup
description: Install Rig on Mac and connect Claude Code to Rig MCP. Use when the user first enables this plugin, MCP tools 401 or are missing, or they ask how to link Claude to Rig.
---

# Set up Rig for Claude Code

Rig is a Mac app that is the local runtime context engine for AI coding agents. This plugin bundles a **cloud MCP** at `https://api.userig.app/mcp` (OAuth). Full localhost logs, ports, git/db, and hub tools need the **Mac app** open and linked.

## Commerce (hard rules)

- Do not offer checkout, upgrades, plan catalogs, or subscription flows.
- If a Cloud entitlement is missing, say so briefly and optionally point to `https://userig.app/pricing` — never a checkout URL.
- Do not upsell.

## 1. Cloud MCP (this plugin)

The plugin’s `.mcp.json` points at `https://api.userig.app/mcp`. On first tool use, complete Rig’s OAuth sign-in in the browser.

If tools 401 or OAuth loops:

1. Sign in at `https://api.userig.app/account`.
2. Retry the tool call so the client can refresh the token.
3. Confirm the client supports Streamable HTTP.

Cloud tools (signed-in account): `list_projects`, `get_project`, `get_status`, `get_logs` (limited without the local hub), `get_health`, `who_owns_port`, and `start_project` / `stop_project` / `restart_project` with `confirm: true` (queues to a linked Mac).

## 2. Local hub (full tool surface)

For live log tails, `lsof`/ports, git/db helpers, and the rest of the hub:

1. Download Rig from `https://userig.app/download`.
2. Open Rig and finish first-run. Leave it running.
3. Open **Connections**, start the MCP hub, choose **Claude**, click **Link**.
4. Start a **new** Claude Code session (config is read on start).

Link writes `~/.claude.json` (user) or the project `.mcp.json` (`type: "http"`, loopback URL + bearer). Prefer Link over hand-editing. If tools 401, rotate the token in Connections and re-link.

Do not invent tokens, ports, or a second cloud URL. The public endpoint is only `https://api.userig.app/mcp`. The local hub is loopback (typically `http://127.0.0.1:47823/mcp` — use the value Rig shows).

## Verify

Ask: “list my Rig projects” or “what’s running in Rig?” Connections → Activity should show the call.
