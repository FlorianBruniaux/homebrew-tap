# Homebrew Tap

Homebrew formulae for FlorianBruniaux projects.

## Installation

```bash
brew tap FlorianBruniaux/tap
brew install ccboard
# or
brew install cc-copilot-bridge
```

## Available Formulae

| Formula | Description | Version |
|---------|-------------|---------|
| `ccboard` | Unified TUI/Web dashboard for Claude Code management | v0.5.0 |
| `cc-copilot-bridge` | Multi-provider switcher for Claude Code CLI | v1.5.3 |

## Usage

### ccboard

```bash
ccboard              # Launch TUI (default)
ccboard web          # Launch web interface (port 3333)
ccboard stats        # Print stats and exit
ccboard search "query"  # Search sessions
ccboard recent 10    # Show recent sessions
```

See [ccboard](https://github.com/FlorianBruniaux/ccboard) for full documentation.

### cc-copilot-bridge

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
