if not vim.g.vscode then
  if vim.g.neovide then
    -- neovide --------------------------------------
    --
    vim.cmd [[
      set guifont=JetBrainsMono_Nerd_Font,Noto_Color_Emoji:h11
      "set guifont=Monaspace_Neon,Noto_Color_Emoji:h12

      "let g:neovide_opacity = 0.97
      let g:neovide_opacity = 0.95
      "let g:neovide_normal_opacity = 1.0
      "let g:neovide_floating_blur_amount_x = 16.0
      "let g:neovide_floating_blur_amount_y = 16.0

      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme randomhue
      "colorscheme kanagawa
      "colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme nordfox
      "colorscheme tokyonight-night
      "colorscheme tokyonight-storm
      "colorscheme tokyonight-moon
      "colorscheme horizon
      colorscheme evergarden
    ]]
  else
    -- nvim -----------------------------------------
    --
    vim.cmd [[
      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme randomhue
      "colorscheme NeoSolarized
      "colorscheme tokyonight-storm
      "colorscheme cyberdream
      "colorscheme kanagawa
      "colorscheme kanagawa-paper-ink
      "colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme dracula
      "colorscheme dayfox
      colorscheme vague
    ]]
  end
end

