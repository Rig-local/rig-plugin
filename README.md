# Rig plugin for Claude Code

Public packaging for the [Rig](https://userig.app) Claude Code plugin. This repository is **not** the Rig product source. The Mac app and Cloud API stay private.

Rig is the local runtime context engine for AI coding agents. This plugin:

- Connects Claude Code to Rig’s **cloud MCP** at `https://api.userig.app/mcp` (OAuth 2.1, Streamable HTTP)
- Adds skills and slash commands for status, health, logs, and gated start/stop
- Documents how to install the Mac app and **Link** Claude for the full local hub

OpenAI / Codex packaging lives separately and is not in this repo.

## Install

Until the plugin is listed in the Claude community marketplace:

```bash
git clone https://github.com/Rig-local/rig-plugin.git
claude --plugin-dir ./rig-plugin
```

After listing, install from the community marketplace as `rig` (namespace `/rig:…`).

Reload with `/reload-plugins` if you already have a session open.

### Commands

| Command | What it does |
| --- | --- |
| `/rig:status` | List projects and run state |
| `/rig:health` | Account / hub health |
| `/rig:logs` | Recent logs for a project |
| `/rig:start` | Start a project (`confirm: true`) |
| `/rig:stop` | Stop a project (`confirm: true`) |

Skills: `/rig:setup` (install + connect), `/rig:rig-runtime` (when to use Rig tools).

## Cloud vs local hub

| Surface | When | Tools |
| --- | --- | --- |
| Cloud MCP (this plugin) | Signed in to Rig Cloud | Catalog, health, ports, gated start/stop/restart on linked Macs |
| Local hub | Rig.app open → Connections → Claude → Link | Full hub: live logs, git/db, env, fleet/mesh |

Writes always need `confirm: true`.

Docs: [userig.app/docs/mcp](https://userig.app/docs/mcp) · [Connect Claude](https://userig.app/docs/mcp-claude)

## Privacy policy

- **Data:** The cloud MCP sees the signed-in Rig account’s project catalog, device presence, and lifecycle commands you confirm. The local hub stays on your Mac.
- **Storage:** Rig Cloud stores account, catalog, and device metadata per [https://userig.app/privacy](https://userig.app/privacy).
- **Third parties:** Anthropic receives tool results you allow Claude Code to send. Rig does not sell that data.
- **Retention:** Account data follows the privacy policy. Local hub logs stay on disk on your Mac.
- **Contact:** [https://help.userig.app](https://help.userig.app)

Terms: [https://userig.app/terms](https://userig.app/terms)

## Validate

```bash
claude plugin validate . --strict
```

## License

Apache License 2.0. The plugin packaging in this repository is open. Rig.app and the Cloud API are proprietary (Rich Harrington Ltd).
