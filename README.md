# dotfiles

## Bootstrap on a new Mac

### 1. Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone this repo to `~/.dotfiles`

```sh
git clone git@github.com:AlexanderLasson/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 3. Install packages

```sh
brew install stow git gh lazygit neovim tmux starship fzf ripgrep fd tree
brew install --cask ghostty font-jetbrains-mono-nerd-font
```

What each is for:

| Tool | Used for |
|---|---|
| `stow` | symlinking this repo into `$HOME` |
| `git` | version control (`.config/git/ignore`) |
| `gh` | GitHub CLI (`.config/gh/`) |
| `lazygit` | git TUI (`lg` alias) |
| `neovim` | editor (`.config/nvim/init.lua`) |
| `tmux` | terminal multiplexer (`.tmux.conf`) |
| `starship` | shell prompt (`.config/starship.toml`, sourced from `.zshrc`) |
| `fzf` | fuzzy finder (`fn` alias: `nvim $(fzf)`) |
| `ripgrep` / `fd` | fast search/find, general TUI/CLI use |
| `tree` | directory listing, general TUI/CLI use |
| `ghostty` (cask) | terminal emulator |
| Nerd Font (cask) | glyphs used by starship, Ghostty, and Zed |

### 4. Symlink everything with Stow

```sh
cd ~/.dotfiles
stow .
```

This creates `~/.zshrc`, `~/.tmux.conf`, `~/.config/nvim`, etc. as symlinks back into
`~/.dotfiles`. If `stow` reports a conflict, it means a real (non-symlink) file already
exists at that path on the new machine — move it aside and re-run.

### 5. Manual steps Stow doesn't cover

- **Ghostty config is not actually symlinked into place.** Ghostty reads its config
  from `~/Library/Application Support/com.mitchellh.ghostty/config`, which is *not*
  a path this repo's Stow layout touches — `.GhosttySettings` and
  `.config/ghostty.config` in this repo are stale, out-of-sync snapshots, not the live
  file. Until this is fixed properly, copy one of them to that path by hand after a
  fresh install.
- **`~/.zshrc.local`** (optional, not tracked) — for machine-local overrides: SSH
  aliases, secrets, per-machine `$PATH` tweaks. Sourced automatically at the end of
  `.zshrc` if present.
- **`p10k` / `oh-my-zsh`** — `.zshrc` references both (`$ZSH` export, a conditional
  `~/.p10k.zsh` source) but doesn't actually source `oh-my-zsh.sh` — the active prompt
  is Starship. Leftover from a past migration; safe to ignore, no install needed.
