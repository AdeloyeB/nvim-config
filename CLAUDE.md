# Neovim Config Setup

## Auto Setup Commands

When the user says "setup nvim", "install neovim", or "setup my editor", run these:

```bash
# Install Neovim + dependencies
brew install neovim ripgrep fd

# Backup existing config
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)

# Clone config
git clone https://github.com/AdeloyeB/nvim-config.git ~/.config/nvim

# Verify
nvim --version
```

Then tell the user to run `nvim` to let plugins auto-install.

## Update Config

When user says "update nvim config":
```bash
cd ~/.config/nvim && git pull
```

## Key Info

- **Theme:** Warp Dark (custom, exact match)
- **Plugin Manager:** lazy.nvim
- **LSP:** Mason + rust-analyzer, lua_ls
- **Leader Key:** Space

## Keybindings Reference

| Keys | Action |
|------|--------|
| `Space ff` | Find files |
| `Space fg` | Live grep |
| `Ctrl+p` | Git files |
| `Space a` | Harpoon add |
| `Ctrl+e` | Harpoon menu |
| `gd` | Go to definition |
| `K` | Hover docs |
| `gc` | Toggle comment |
| `-` | File explorer |
| `Space gs` | Git status |
| `Space u` | Undo tree |
