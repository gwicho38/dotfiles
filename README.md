# Dotfiles

Personal dotfiles managed with [RCM](https://github.com/thoughtbot/rcm).

## Quick Start

```bash
# Install dotfiles
rcup -v

# Reload shell
source ~/.zshrc
```

## Directory Structure

```
~/repos/dotfiles/
├── config/
│   ├── zsh/          # Zsh configuration
│   ├── alacritty/    # Terminal config
│   ├── gh/           # GitHub CLI config
│   ├── htop/         # Process viewer config
│   └── karabiner/    # Keyboard customization
├── zshrc             # Main zsh config
├── zshenv            # Zsh environment
├── rcrc              # RCM configuration
└── README.md
```

## Dotfile Management Commands

### Manual Workflow

```bash
# Edit dotfiles in repo
edot

# Sync changes from home to repo
dotsync

# Commit and push changes
dotcommit "commit message"

# Full workflow (sync + commit + push)
dotupdate "commit message"

# Pull latest dotfiles and re-link
dotpull

# Check repo status
dotstatus

# View changes
dotdiff

# List all managed symlinks
dotlist
```

### Automated Workflow

```bash
# Enable automatic tracking (checks every 30 min)
dotauto-enable

# Disable automatic tracking
dotauto-disable

# Manually trigger auto-sync (for testing)
dotauto-trigger
```

When enabled, dotfiles are automatically synced and committed every 30 minutes if changed.

## Makefile Wrapper Functions

Convenient shortcuts for common project commands:

### Conduit (Elixir Phoenix)
- `conduit-server` - Start development server
- `conduit-test` - Run tests
- `conduit-logs` - View logs
- `conduit-db-reset` - Reset database

### MCLI (Python CLI)
- `mcli-setup` - Initial setup
- `mcli-build` - Build project
- `mcli-test` - Run tests
- `mcli-wheel` - Build wheel
- `mcli-install` - Install locally

### LSH (Node.js CLI)
- `lsh-build` - Build project
- `lsh-test` - Run tests
- `lsh-daemon-start/stop` - Manage daemon

### SaiyanQuest (Python Game)
- `sq-run` - Run game
- `sq-test` - Run tests
- `sq-build` - Build game

### Outlet (Flutter Mobile)
- `outlet-dev` - Start dev server
- `outlet-dev-ios` - iOS dev
- `outlet-build-android` - Build Android
- `outlet-test` - Run tests

### MyAI, Luminus RPG, Vault
- `myai-dev`, `luminus-dev` - Start dev servers
- `vault-sync`, `vault-check` - Manage vault

### Generic
- `m <target>` - Run any Makefile target in current directory

## RCM Configuration

Dotfiles are symlinked from `~/repos/dotfiles` to `~` using RCM.

The `config/` directory is symlinked to `~/.config/`.

See `rcrc` for full configuration.

## Installation on New Machine

```bash
# Clone repo
git clone https://github.com/gwicho38/dotfiles.git ~/repos/dotfiles

# Install RCM (macOS)
brew install rcm

# Create rcup config
echo 'DOTFILES_DIRS="$HOME/repos/dotfiles"' > ~/.rcrc

# Install dotfiles
rcup -v

# Reload shell
source ~/.zshrc
```
