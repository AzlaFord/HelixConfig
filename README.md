
# Helix config

My [Helix](https://helix-editor.com/) editor configuration.

## Files

- `config.toml`: editor settings, theme and keybindings
- `languages.toml`: language server and formatter settings
- `install.sh`: installs Helix, the language servers and formatters, and links this repo to `~/.config/helix`

## Requirements

Helix does not install language servers or formatters itself. These need to be on your `PATH` for the config to work fully:

| Tool | Used for | Install |
|---|---|---|
| `helix` | the editor | `sudo dnf install helix` |
| `typescript-language-server` | JavaScript / TypeScript / JSX / TSX | `npm i -g typescript typescript-language-server` |
| `vscode-langservers-extracted` | CSS, HTML, JSON, ESLint | `npm i -g vscode-langservers-extracted` |
| `tailwindcss-language-server` | Tailwind CSS | `npm i -g @tailwindcss/language-server` |
| `emmet-ls` | Emmet in HTML | `npm i -g emmet-ls` |
| `prettier` | formatter for JS / TS / JSON | `npm i -g prettier` |
| `pyright` | Python language server | `npm i -g pyright` |
| `ruff` | Python linter | `pipx install ruff` |
| `gopls` | Go language server | `go install golang.org/x/tools/gopls@latest` |
| `dlv` | Go debugger | `go install github.com/go-delve/delve/cmd/dlv@latest` |
| `fish_indent` | fish formatter | comes with the `fish` package |

Prerequisites for the commands above: `nodejs`, `npm`, `golang` and `pipx`.

## Install

On a fresh machine (Fedora):

```bash
git clone git@github.com:YOUR_USERNAME/helix-config.git ~/dotfiles/helix
cd ~/dotfiles/helix
./install.sh
```

If `~/.config/helix` already exists, move or delete it first, otherwise the symlink will be created inside it.

### PATH

Make sure these directories are on your `PATH`:

- `~/go/bin` (for `gopls` and `dlv`)
- `~/.local/bin` (for `ruff` installed with `pipx`)

For example, add this to `~/.bashrc`:

```bash
export PATH="$HOME/go/bin:$HOME/.local/bin:$PATH"
```

## Verify

```bash
hx --health
```

Check that the languages you use show a ✓ next to their language server and formatter.
