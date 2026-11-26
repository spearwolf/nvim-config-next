if not vim.g.vscode then
  if vim.g.neovide then
    vim.cmd([[
      set guifont=JetBrainsMono_Nerd_Font,Noto_Color_Emoji:h15
      let g:neovide_opacity = 0.85
      set signcolumn=yes
      set number
    ]])
    -- vim.cmd.colorscheme("vague")
    -- vim.cmd.colorscheme("dune-tleilaxu")
    -- vim.cmd.colorscheme("kanagawa-dragon")
    vim.cmd.colorscheme("fluoromachine")

    vim.g.neovide_input_ime = false

    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_blur_amount_x = 6.0
    vim.g.neovide_floating_blur_amount_y = 6.0
  else
    vim.cmd([[
      set signcolumn=yes
    ]])
    -- vim.cmd.colorscheme("tokyonight-storm")
    vim.cmd.colorscheme("onedark")
  end
end
