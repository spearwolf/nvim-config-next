if not vim.g.vscode then
  if vim.g.neovide then
    vim.cmd([[
      set guifont=JetBrainsMono_Nerd_Font,Noto_Color_Emoji:h15
      let g:neovide_opacity = 0.95
      set signcolumn=yes
      set number
    ]])
    vim.cmd.colorscheme("vague")

    vim.g.neovide_input_ime = false
  else
    vim.cmd([[
      set signcolumn=yes
    ]])
    vim.cmd.colorscheme("tokyonight-storm")
  end
end
