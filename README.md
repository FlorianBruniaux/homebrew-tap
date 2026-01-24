# Homebrew Tap

Homebrew formulae for FlorianBruniaux projects.

## Installation

```bash
brew tap FlorianBruniaux/tap
brew install cc-copilot-bridge
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `cc-copilot-bridge` | Multi-provider switcher for Claude Code CLI |

## Usage

After installation:

```bash
eval "$(claude-switch --shell-config)"
```

Then use the commands:
- `ccd` - Anthropic Direct
- `ccc` - GitHub Copilot
- `cco` - Ollama Local
- `ccs` - Status check

See [cc-copilot-bridge](https://github.com/FlorianBruniaux/cc-copilot-bridge) for full documentation.
