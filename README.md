# Neovim Config

A fast, modern Neovim configuration optimized for Rust development.

```
┌─ 1  main.rs ────────┬─ 2  terminal ─────────┐
│ fn main() {         │ $ cargo run           │
│     println!("hi"); │ Compiling...          │
│ }                   │ Hello, world!         │
└─────────────────────┴───────────────────────┘
```

## Features

### Navigation
| Plugin | What it does | Key |
|--------|--------------|-----|
| **Telescope** | Fuzzy find files, grep, buffers | `Space ff` `Space fg` |
| **Harpoon** | Pin files for instant switching | `Space a` `Ctrl+h/t/n/s` |
| **Oil** | File explorer as a buffer | `-` or `Space e` |
| **Window Picker** | Jump to windows by number | `Space 1-4` or `Space ww` |

### Coding
| Plugin | What it does | Key |
|--------|--------------|-----|
| **LSP** | Go to definition, hover, rename | `gd` `K` `Space rn` |
| **nvim-cmp** | Autocompletion with snippets | `Tab` `Enter` |
| **Treesitter** | Syntax highlighting | automatic |
| **Autopairs** | Auto-close brackets | automatic |
| **Comment** | Toggle comments | `gcc` `gc` |
| **Conform** | Format on save | automatic |

### Rust-Specific
| Plugin | What it does |
|--------|--------------|
| **rust-analyzer** | Full LSP with Clippy on save |
| **rustaceanvim** | Enhanced Rust tooling |
| **crates.nvim** | Cargo.toml dependency hints |

### Git
| Plugin | What it does | Key |
|--------|--------------|-----|
| **Fugitive** | Git commands in Neovim | `Space gs` |
| **Gitsigns** | Line-by-line git status | automatic |

### Quality of Life
| Plugin | What it does | Key |
|--------|--------------|-----|
| **Which-Key** | Shows available keybindings | `Space` (wait) |
| **Trouble** | Pretty diagnostics list | `Space xx` |
| **Undotree** | Visual undo history | `Space u` |
| **Lualine** | Status bar + window numbers | automatic |
| **Wilder** | Command line completion | `:` (type) |

## Keybindings

### Leader Key: `Space`

#### Files & Search
| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fg` | Live grep |
| `Space fb` | Find buffers |
| `Ctrl+p` | Git files |
| `Space ps` | Grep string |

#### Harpoon (Pinned Files)
| Key | Action |
|-----|--------|
| `Space a` | Add file to harpoon |
| `Ctrl+e` | Open harpoon menu |
| `Ctrl+h` | Harpoon file 1 |
| `Ctrl+t` | Harpoon file 2 |
| `Ctrl+n` | Harpoon file 3 |
| `Ctrl+s` | Harpoon file 4 |

#### Windows
| Key | Action |
|-----|--------|
| `Space 1-4` | Jump to window 1-4 |
| `Space ww` | Pick window (shows numbers) |
| `Ctrl+w v` | Vertical split |
| `Ctrl+w s` | Horizontal split |
| `Ctrl+w q` | Close window |

#### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `Space rn` | Rename symbol |
| `Space ca` | Code actions |
| `Space f` | Format file |
| `[d` / `]d` | Previous/next diagnostic |

#### Editing
| Key | Action |
|-----|--------|
| `Space w` | Save file |
| `Space s` | Search & replace word under cursor |
| `Space y` | Copy to system clipboard |
| `Space d` | Delete to void register |
| `Space p` | Paste without losing register |
| `jk` | Escape (insert mode) |
| `J` / `K` | Move selection up/down (visual) |

#### Tools
| Key | Action |
|-----|--------|
| `Space e` | File explorer (Oil) |
| `Space gs` | Git status |
| `Space u` | Undo tree |
| `Space xx` | Toggle diagnostics |

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone https://github.com/AdeloyeB/nvim-config.git ~/.config/nvim

# Open Neovim (plugins install automatically)
nvim
```

### Requirements

- Neovim >= 0.9
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope grep)
- Node.js (for some LSPs)
- Rust toolchain (for Rust development)

```bash
# macOS
brew install neovim ripgrep node

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Theme

Custom **Warp Dark** colorscheme included in `colors/warp_dark.lua`.

## Structure

```
~/.config/nvim/
├── init.lua          # Main config (plugins + keymaps)
├── colors/
│   └── warp_dark.lua # Custom colorscheme
└── lazy-lock.json    # Plugin versions
```

## Credits

Inspired by [ThePrimeagen](https://github.com/ThePrimeagen) and the Neovim community.
