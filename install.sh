#!/usr/bin/env bash
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
config_home=${XDG_CONFIG_HOME:-"$HOME/.config"}
opencode_home="$config_home/opencode"

if ! command -v uv >/dev/null 2>&1; then
  printf '%s\n' "uv is required to install the local MCP servers" >&2
  exit 1
fi

if ! command -v ast-grep >/dev/null 2>&1; then
  uv tool install ast-grep-cli
fi

if ! command -v serena >/dev/null 2>&1; then
  uv tool install -p 3.13 serena-agent
fi

if [ ! -f "$HOME/.serena/serena_config.yml" ]; then
  serena init
fi

if ! command -v ast-grep-server >/dev/null 2>&1 || ! ast-grep-server --help >/dev/null 2>&1; then
  uv tool install --with 'mcp<2' --from git+https://github.com/ast-grep/ast-grep-mcp sg-mcp
fi

mkdir -p "$opencode_home" "$HOME/.opencode"
ln -sfn "$root/opencode/opencode.jsonc" "$opencode_home/opencode.jsonc"
ln -sfn "$root/ai-prompts/agents" "$opencode_home/agents"
ln -sfn "$root/ai-prompts/commands" "$opencode_home/commands"
ln -sfn "$root/agent-skills/skills" "$opencode_home/skills"
ln -sfn "$root/ai-prompts/CLAUDE.md" "$HOME/.opencode/CLAUDE.md"

printf '%s\n' "Installed OpenCode configuration in $opencode_home"
printf '%s\n' "Source env with: source $root/opencode/env.sh"
