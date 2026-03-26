# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's managed

| File in repo | Deployed to | Description |
|---|---|---|
| `Brewfile` | `~/Brewfile` | Homebrew packages, casks, and Mac App Store apps |
| `dot_tmux.conf` | `~/.tmux.conf` | Redirects tmux to XDG config path |
| `dot_config/tmux/tmux.conf` | `~/.config/tmux/tmux.conf` | tmux config — catppuccin mocha theme |
| `dot_config/starship.toml` | `~/.config/starship.toml` | Starship prompt — catppuccin mocha theme |
| `dot_zshrc` | `~/.zshrc` | Zsh config |
| `.chezmoiscripts/run_once_install-tpm.sh` | *(runs once on apply)* | Clones TPM (tmux plugin manager) |

## Bootstrap a new Mac

Clone this repo and run the bootstrap script:

```bash
git clone <repo-url> ~/LocalDocuments/dotfiles
cd ~/LocalDocuments/dotfiles
bash bootstrap.sh
```

The script will:
1. Install [Homebrew](https://brew.sh) if missing
2. Install chezmoi via brew
3. Apply all dotfiles
4. Run `brew bundle` to install all packages

## After bootstrap

### tmux
Start tmux and install plugins:
```bash
tmux
# Then press: Ctrl+B then I (capital i)
```

### iTerm2
- Preferences > Profiles > Text > Font → **JetBrainsMono Nerd Font**
- Preferences > Profiles > Terminal > Report Terminal Type → `xterm-256color`

## Day-to-day chezmoi usage

```bash
# After editing a file in the repo, sync to home dir
chezmoi apply

# See what's out of sync
chezmoi status

# Edit a managed file and apply in one step
chezmoi edit ~/.zshrc
```

## Tools

| Tool | Purpose |
|---|---|
| [chezmoi](https://www.chezmoi.io/) | Dotfile manager |
| [tmux](https://github.com/tmux/tmux) + [catppuccin](https://github.com/catppuccin/tmux) | Terminal multiplexer with catppuccin mocha theme |
| [TPM](https://github.com/tmux-plugins/tpm) | tmux plugin manager |
| [Starship](https://starship.rs) | Cross-shell prompt with catppuccin mocha theme |
| [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) | Font with icons for tmux and starship |
