#!/bin/sh
# Builds the Authorization header for https://api.userig.app/mcp.
# The only accepted secret is the plugin userConfig option rig_account_pat
# (sensitive: true), which Claude exposes as CLAUDE_PLUGIN_OPTION_RIG_ACCOUNT_PAT.
# When that option is empty, print no headers so the client can use browser OAuth.
# Do not read tokens from files, the shell profile, or any other environment variable.
token="${CLAUDE_PLUGIN_OPTION_RIG_ACCOUNT_PAT:-}"
if [ -z "$token" ]; then
  printf '%s\n' '{}'
  exit 0
fi
escaped=$(printf '%s' "$token" | sed 's/\\/\\\\/g; s/"/\\"/g')
printf '{"Authorization":"Bearer %s"}\n' "$escaped"
