# Install Rig MCP (for agents)

You are installing the Rig MCP plugin for this user. Do not clone the private Rig product. This public repo is packaging only.

## Cloud MCP (works without cloning)

Add this server. Transport is Streamable HTTP. Auth is OAuth 2.1.

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

- Cursor: `~/.cursor/mcp.json`
- Claude Code: `~/.claude.json` (`type: "http"`)
- VS Code: `.vscode/mcp.json` uses `"servers"` not `"mcpServers"`
- Windsurf: `~/.codeium/windsurf/mcp_config.json` uses `"serverUrl"` not `"url"`
- Gemini CLI: `gemini mcp add --transport http rig https://api.userig.app/mcp` or `gemini extensions install https://github.com/Rig-local/rig-plugin`
- Codex: `codex mcp add rig --url https://api.userig.app/mcp`

If the client needs a public OAuth client ID, tell the user to sign in via the browser prompt. Do not invent a client ID.

## Local hub (full tools)

1. Download https://userig.app/download
2. Open Rig → Connections → start MCP hub → Link the current agent
3. Prefer Link over hand-editing tokens

Verify by calling `list_projects`. Writes need `confirm: true`.
