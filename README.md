# Neovim Config

Personal Neovim setup with Warp Dark theme and essential plugins.

## Quick Install (New Machine)

```bash
# 1. Install Neovim
brew install neovim

# 2. Install dependencies
brew install ripgrep fd

# 3. Clone this config
git clone https://github.com/AdeloyeB/nvim-config.git ~/.config/nvim

# 4. Open Neovim (plugins install automatically)
nvim
```

## What's Included

- **Theme:** Custom Warp Dark (exact match)
- **Telescope:** Fuzzy finder
- **Treesitter:** Syntax highlighting
- **LSP + Mason:** IDE features
- **Harpoon:** File bookmarks
- **Oil:** File explorer
- **Git:** Fugitive + Gitsigns
- **Rust:** rustaceanvim + crates.nvim

## Key Bindings

Leader = `Space`

| Keys | Action |
|------|--------|
| `Space ff` | Find files |
| `Space fg` | Live grep |
| `Ctrl+p` | Git files |
| `Space a` | Harpoon add |
| `Ctrl+e` | Harpoon menu |
| `gd` | Go to definition |
| `K` | Hover docs |
| `Space rn` | Rename symbol |
| `Space ca` | Code actions |
| `gc` | Toggle comment |
| `-` | File explorer (Oil) |
| `Space gs` | Git status |
| `Space u` | Undo tree |
| `jk` | Escape |
| `Space w` | Save |
