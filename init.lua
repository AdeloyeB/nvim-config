-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key (must be before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.backspace = "indent,eol,start"

-- Load plugins
require("lazy").setup({
  -- ===================
  -- PERSISTENCE (Session Management)
  -- ===================
  {
    "folke/persistence.nvim",
    lazy = false,  -- Load immediately so dashboard can use it
    config = function()
      require("persistence").setup({
        dir = vim.fn.stdpath("state") .. "/sessions/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },

  -- ===================
  -- ALPHA (Dashboard)
  -- ===================
  {
    "goolord/alpha-nvim",
    lazy = false,  -- Load immediately on startup
    priority = 1000,  -- Load before other plugins
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Pikachu ASCII Art
      dashboard.section.header.val = {
        [[                                              ]],
        [[         ⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀        ]],
        [[        ⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦      ]],
        [[       ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧     ]],
        [[      ⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠃⠀⠀⠀⠘⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣠⣴⣶⣶⣦⣶⣶⣦⣄⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⠁⢸⣿⣿⣿⡟⢻⣿⣿⣿⣿⡇⠈⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠸⣿⣿⠟⠀⠀⠻⣿⣿⠟⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿    ]],
        [[      ⢿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⣤⣤⣤⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡿    ]],
        [[      ⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠈⠛⠁⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇    ]],
        [[       ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟     ]],
        [[        ⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋      ]],
        [[          ⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁        ]],
        [[                  ⠉⠉⠉⠉⠉⠉⠉⠉                ]],
        [[                                              ]],
        [[              Y Ū S H A   V I M               ]],
      }

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("s", "  Open Last Session", ":lua require('persistence').load()<CR>"),
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Live Grep", ":Telescope live_grep<CR>"),
        dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Footer
      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        return "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded"
      end

      dashboard.section.footer.opts.hl = "Comment"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"

      -- Set highlight for each button
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      alpha.setup(dashboard.opts)

      -- Highlights
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#FFD700" })  -- Yellow for Pikachu
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#5C9FD8" }) -- Warp blue for buttons
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#5C9FD8", bold = true }) -- Blue for shortcut keys
    end,
  },

  -- ===================
  -- TELESCOPE (Fuzzy Finder)
  -- ===================
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Grep string" })
    end,
  },

  -- ===================
  -- TREESITTER (Syntax Highlighting)
  -- ===================
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "rust", "lua", "vim", "vimdoc", "javascript", "typescript", "python", "json", "toml", "markdown" })

      -- Enable treesitter highlighting for all supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  -- ===================
  -- LSP (Language Server Protocol)
  -- ===================
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "lua_ls" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Rust
      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
          },
        },
      }
      vim.lsp.enable("rust_analyzer")

      -- Lua
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      }
      vim.lsp.enable("lua_ls")

      -- LSP Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },

  -- ===================
  -- AUTOCOMPLETE
  -- ===================
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- ===================
  -- HARPOON (File Navigation)
  -- ===================
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add" })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
    end,
  },

  -- ===================
  -- WHICH-KEY (Keybinding Help)
  -- ===================
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  -- ===================
  -- LUALINE (Status Bar)
  -- ===================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
        -- Show window number at top of each window
        winbar = {
          lualine_a = {
            { function() return " " .. vim.api.nvim_win_get_number(0) end },
          },
          lualine_b = { "filename" },
        },
        inactive_winbar = {
          lualine_a = {
            { function() return " " .. vim.api.nvim_win_get_number(0) end },
          },
          lualine_b = { "filename" },
        },
      })
    end,
  },

  -- ===================
  -- COMMENT (Toggle Comments)
  -- ===================
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- ===================
  -- AUTOPAIRS (Auto close brackets)
  -- ===================
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- ===================
  -- WINDOW PICKER (Visual labels)
  -- ===================
  {
    "yorickpeterse/nvim-window",
    config = function()
      require("nvim-window").setup({
        chars = { '1', '2', '3', '4', '5', '6', '7', '8', '9' },
      })
      vim.keymap.set("n", "<leader>ww", require("nvim-window").pick, { desc = "Pick window" })
    end,
  },

  -- ===================
  -- OIL (File Explorer)
  -- ===================
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "File explorer" })
    end,
  },

  -- ===================
  -- TROUBLE (Diagnostics)
  -- ===================
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })
    end,
  },

  -- ===================
  -- GIT
  -- ===================
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
    end,
  },

  -- ===================
  -- RUST SPECIFIC
  -- ===================
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- ===================
  -- LSP SIGNATURE (Function hints)
  -- ===================
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = true,
        hint_prefix = "→ ",
        handler_opts = {
          border = "rounded",
        },
      })
    end,
  },

  -- ===================
  -- FORMATTER (Prettier, etc.)
  -- ===================
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
        format_on_save = function(bufnr)
          return {
            timeout_ms = 2000,
            lsp_format = "fallback",
          }
        end,
      })
    end,
  },

  -- ===================
  -- MARKDOWN RENDERING
  -- ===================
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  -- ===================
  -- UNDOTREE (Undo History)
  -- ===================
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
    end,
  },

  -- ===================
  -- COMMAND LINE COMPLETION
  -- ===================
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      wilder.set_option("renderer", wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
      }))
    end,
  },
})

-- Load Warp Dark colorscheme
vim.cmd.colorscheme("warp_dark")

-- ===================
-- ADDITIONAL KEYMAPS (ThePrimeagen style)
-- ===================

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without losing register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Quick escape
vim.keymap.set("i", "jk", "<Esc>")

-- Quick save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Window switching by number (direct jump)
vim.keymap.set("n", "<leader>1", "1<C-w>w", { desc = "Window 1" })
vim.keymap.set("n", "<leader>2", "2<C-w>w", { desc = "Window 2" })
vim.keymap.set("n", "<leader>3", "3<C-w>w", { desc = "Window 3" })
vim.keymap.set("n", "<leader>4", "4<C-w>w", { desc = "Window 4" })

