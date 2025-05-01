if not vim.g.vscode then
  if vim.g.neovide then
    -- neovide --------------------------------------
    --
    vim.cmd [[
      set guifont=JetBrainsMono\ Nerd\ Font:h11

      let g:neovide_opacity = 0.94
      "let g:neovide_normal_opacity = 1.0
      "let g:neovide_floating_blur_amount_x = 16.0
      "let g:neovide_floating_blur_amount_y = 16.0

      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme randomhue
      "colorscheme onedark
      "colorscheme falcon
      "colorscheme NeoSolarized
      "colorscheme cyberdream
      "colorscheme kanagawa
      "colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme lackluster-hack
      colorscheme kanagawa-paper-ink
      "colorscheme nordic
    ]]
  else
    -- nvim -----------------------------------------
    --
    vim.cmd [[
      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme randomhue
      "colorscheme onedark
      "colorscheme falcon
      "colorscheme NeoSolarized
      "colorscheme kanagawa
      "colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme lackluster-hack
      "colorscheme cyberdream
      colorscheme kanagawa-paper-ink
    ]]
  end
end

