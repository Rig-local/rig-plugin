# Marketplace submissions

Public packaging only. **Never** put demo bearers, ASC passwords, or Railway secrets in this repo.

Live MCP: `https://api.userig.app/mcp` · Health: `https://api.userig.app/mcp/health` · OAuth resource metadata: `https://api.userig.app/.well-known/oauth-protected-resource`

## Ready in this repo

| Surface | Status |
| --- | --- |
| Manifests (Claude / Cursor / Gemini / Codex / Grok) | Shipped — all point at cloud MCP |
| Skills + slash commands | Shipped — fair-play / no checkout; prefer Connections → Link |
| `claude plugin validate . --strict` | Run before each tag |
| OpenAI With MCP review credentials | Private monorepo `apps/desktop/openai-plugin/SUBMISSION.md` + Railway `api` vars only |

## Still needed (human submit)

### Claude Code — Plugins directory

1. Confirm org access (Console Developer/Admin/Owner or claude.ai Team/Enterprise Owner).
2. Submit this public GitHub URL: `https://github.com/Rig-local/rig-plugin`
3. Docs: [Create plugins](https://code.claude.com/docs/en/plugins) · [Submit](https://claude.com/docs/plugins/submit)

### Claude — Connectors directory (MCP)

Closer to OpenAI “With MCP”. Submit `https://api.userig.app/mcp` with OAuth discovery. Do not paste demo tokens into public forms if the portal stores them publicly — use reviewer-only fields.

Docs: [Connectors submission](https://claude.com/docs/connectors/building/submission)

### Grok Build — xAI plugin marketplace

1. Fork [xai-org/plugin-marketplace](https://github.com/xai-org/plugin-marketplace)
2. Add a remote entry to `.grok-plugin/marketplace.json`:

```json
{
  "name": "rig",
  "description": "Rig local runtime context for coding agents. Cloud MCP for project catalog, health, ports, and gated start/stop/restart on Macs linked to your Rig account.",
  "homepage": "https://userig.app",
  "category": "development",
  "keywords": ["rig", "userig", "rig mcp"],
  "source": {
    "source": "url",
    "url": "https://github.com/Rig-local/rig-plugin.git",
    "sha": "<full-40-char-lowercase-commit-sha>"
  }
}
```

3. Pin SHA: `git ls-remote https://github.com/Rig-local/rig-plugin.git HEAD`
4. Run `python3 scripts/generate-plugin-index.py` then `python3 scripts/validate-catalog.py`
5. Open the PR. Keep keywords brand-scoped (`rig`, `userig`) — avoid generic `mcp`/`cli` CTA spam.

### Cursor

- Community: [cursor.directory/plugins/new](https://cursor.directory/plugins/new) with this repo
- Official Cursor marketplace publish when available for your account

### Gemini CLI

- `gemini extensions install https://github.com/Rig-local/rig-plugin`
- Gallery listing follows Google’s extension publish process when offered

### OpenAI / Codex

Use the private monorepo kit (`apps/desktop/openai-plugin/`) for portal upload + Scan Tools. This public repo mirrors `.codex-plugin/` and skills without reviewer secrets.

## Security notes for reviewers

- Cloud MCP is authenticated (OAuth or PAT). No Bearer → 401 + WWW-Authenticate.
- Writes require `confirm: true`.
- Mesh screen / secrets vault tools are **not** on the cloud MCP surface.
- Local hub remains loopback while Rig.app is open.
