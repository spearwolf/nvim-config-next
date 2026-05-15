-- my personal neovim v0.12+ config
-- created by spearwolf, may'26

-- recommended setup (outside of neovim, inside your terminal):
-- $ npm i -g neovim tree-sitter-cli

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.cmd([[
  source $HOME/.config/nvim/common.vim
]])

vim.opt.compatible = false
vim.opt.laststatus = 3
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.termguicolors = true
vim.opt.timeoutlen = vim.g.vscode and 1000 or 500

if not vim.g.vscode then
  vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/vague-theme/vague.nvim",
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/stevearc/aerial.nvim",
    "https://github.com/Saghen/blink.lib",
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/RRethy/vim-illuminate",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/github/copilot.vim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/lewis6991/satellite.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/RaafatTurki/corn.nvim",
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/navarasu/onedark.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
    "https://github.com/scottmckendry/cyberdream.nvim",
    "https://github.com/maxmx03/fluoromachine.nvim",
  })

  require("onedark").setup({
    -- style = "cool",
    style = "deep",
    -- style = "darker",
    -- style = "warmer",
  })

  require("fluoromachine").setup({
    -- theme = "fluoromachine",
    -- theme = "retrowave",
    theme = "delta",
    transparent = false,
  })

  require("cyberdream").setup({
    variant = "light",
    transparent = false,
    saturation = 0.7,
    italic_comments = false,
    hide_fillchars = false,
    terminal_colors = true,
    cache = false,
  })

  if vim.g.neovide then
    vim.cmd([[
      set guifont=JetBrainsMono_Nerd_Font,Noto_Color_Emoji:h11
      let g:neovide_opacity = 0.95
      set signcolumn=yes
      set number
    ]])
    -- vim.cmd.colorscheme('kanagawa')
    -- vim.cmd.colorscheme('kanagawa-dragon')
    -- vim.cmd.colorscheme('kanagawa-lotus')
    -- vim.cmd.colorscheme('kanagawa-wave')
    -- vim.cmd.colorscheme("tokyonight-storm")
    -- vim.cmd.colorscheme("vague")
    -- vim.cmd.colorscheme("catppuccin")
    -- vim.cmd.colorscheme("catppuccin-latte")
    require("onedark").load()
    -- vim.cmd.colorscheme("fluoromachine")

    vim.g.neovide_input_ime = false
  else
    vim.cmd([[
      set signcolumn=yes
    ]])
    -- vim.cmd.colorscheme('tokyonight')
    -- vim.cmd.colorscheme('tokyonight-day')
    -- vim.cmd.colorscheme('tokyonight-moon')
    -- vim.cmd.colorscheme("tokyonight-night")
    -- vim.cmd.colorscheme('tokyonight-storm')
    -- vim.cmd.colorscheme("catppuccin-latte")
    -- vim.cmd.colorscheme("dayfox")
    -- vim.cmd.colorscheme("dawnfox")
    vim.cmd.colorscheme("cyberdream")
  end

  require("config.lsp")
  require("plugins.aerial")
  require("plugins.blink")
  require("plugins.lualine")
  require("bufferline").setup()
  require("illuminate").configure()
  require("telescope").setup({})
  require("neo-tree").setup({})
  require("render-markdown").setup()
  require("gitsigns").setup()
  require("plugins.conform")
  require("satellite").setup()
  require("plugins.trouble")
  require("plugins.lazydev")
  require("plugins.corn")

  -- === key === ========================================== === --

  -- Move Lines
  vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
  vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
  vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
  vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
  vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
  vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

  vim.cmd([[
    " Copy'n'Paste
    nmap <silent> <C-S-c> "+y
    vmap <silent> <C-S-c> "+y
    map <silent> <C-S-v> "+p
    imap <silent> <C-S-v> <Esc>"+pa

    " Copy to clipboard
    vnoremap <leader>y "+y
    nnoremap <leader>Y "+yg_
    nnoremap <leader>y "+y
    nnoremap <leader>yy "+yy

    " Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P

    " Home + End
    nmap <silent> <Home> gg
    nmap <silent> <End> G

    " Tabs
    nnoremap <M-S-t> <cmd>tabnew<cr>
    map <silent> <M-S-w> <Esc>:tabclose<cr>
    map <silent> <M-S-Left> <Esc>:tabprevious<cr>
    map <silent> <M-S-Right> <Esc>:tabnext<cr>

    nnoremap <C-p> <cmd>Telescope find_files<cr>
    nnoremap <C-S-p> <cmd>Telescope aerial<cr>
    "nnoremap <M-S-p> <cmd>Telescope buffers<cr>
    nnoremap <C-Tab> <cmd>Telescope buffers<cr>
  ]])

  vim.keymap.set("n", "<F3>", "<cmd>Neotree toggle<cr>")
  vim.keymap.set("n", "<F4>", "<cmd>Trouble toggle diagnostics<cr>")

  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "live grep" })
  vim.keymap.set("n", "<leader>?", builtin.help_tags, { desc = "help tags" })

  vim.keymap.set("n", "<C-S-i>", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer" })

  -- Inkrementieren (Auswahl erweitern) im Visual/Select-Modus
  vim.keymap.set("x", "<C-Up>", function()
    require("vim.treesitter._select").select_parent(vim.v.count1)
  end, { desc = "Textobjekt inkrementieren" })

  -- Optional: Dekrementieren (Auswahl verkleinern) mit Alt + Pfeiltaste runter
  vim.keymap.set("x", "<C-Down>", function()
    require("vim.treesitter._select").select_child(vim.v.count1)
  end, { desc = "Textobjekt dekrementieren" })

  -- Mappt M-Enter im Visual Mode, um die 'ai' Selektion auszuführen
  vim.keymap.set("x", "<M-CR>", "ai", { remap = true, desc = "Wähle das gesamte Textobjekt (ai)" })

  require("which-key")

  -- === -------------------------------------------------- === --
end -- not vscode
