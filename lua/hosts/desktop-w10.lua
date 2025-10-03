if not vim.g.vscode then
  if vim.g.neovide then
    -- neovide --------------------------------------
    --
    vim.cmd [[
      set guifont=JetBrainsMono\ Nerd\ Font:h11
      "set guifont=Monaspace\ Xenon:h12

      "let g:neovide_opacity = 0.97
      let g:neovide_opacity = 0.93
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
      "colorscheme nordic
      "colorscheme nordfox
      "colorscheme kanagawa-paper-ink
      colorscheme witch-dark
      "colorscheme melange
      "colorscheme tokyonight-night
      "colorscheme horizon
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
      "colorscheme horizon
      "colorscheme tokyonight-storm
      "colorscheme lackluster-hack
      "colorscheme cyberdream
      "colorscheme kanagawa-paper-ink
      "colorscheme fluoromachine
      "colorscheme melange
      colorscheme dracula
      "colorscheme dayfox
      "colorscheme witch-light
    ]]
  end
end

