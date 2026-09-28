# Install Rig MCP (for agents)

You are installing the Rig MCP plugin for this user. Do not clone the private Rig product. This public repo is packaging only.

## Cloud MCP (works without cloning)

Add this server. Transport is Streamable HTTP. Auth is OAuth 2.1 in the browser.

Do not read tokens from the user’s environment or files. An account PAT, if one is required, is entered in the plugin option `rig_account_pat` (`sensitive: true`) and is sent only to `https://api.userig.app/mcp`. Leave that option blank for OAuth. Do not send a local hub token to the cloud URL.

```json
{
  "mcpServers": {
    "rig": {
      "type": "http",
      "url": "https://api.userig.app/mcp"
    }
  }
}
```

Prefer the plugin or extension install. Do not open MCP config files to copy credentials. Field names differ by client: Cursor `url`, Claude Code `type: "http"`, VS Code `servers`, Windsurf `serverUrl`, Gemini CLI `httpUrl`. Codex: `codex mcp add rig --url https://api.userig.app/mcp`. Gemini CLI can also run `gemini extensions install https://github.com/Rig-local/rig-plugin`. Grok Build uses the same HTTPS URL.

Cloud tools (9): `list_projects`, `get_project`, `get_status`, `get_logs`, `get_health`, `who_owns_port`, `start_project`, `stop_project`, `restart_project`. Writes need `confirm: true`.

If the client needs a public OAuth client ID, tell the user to sign in via the browser prompt. Do not invent a client ID.

## Local hub (full tools)

1. Download https://userig.app/download
2. Open Rig → Connections → start MCP hub → the user links the current agent
3. Do not read or copy a hub token

Verify by calling `list_projects`. Writes need `confirm: true`.
