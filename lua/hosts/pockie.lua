if not vim.g.vscode then
  if vim.g.neovide then
    -- neovide --------------------------------------
    --
    vim.cmd [[
      "let g:neovide_normal_opacity = 1.0
      "let g:neovide_floating_blur_amount_x = 16.0
      "let g:neovide_floating_blur_amount_y = 16.0
      let g:neovide_fullscreen = v:true
      let g:neovide_transparency = 0.93
      let g:neovide_cursor_animate_in_insert_mode = v:true

      set guifont=JetBrainsMono\ Nerd\ Font:h14

      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme randomhue
      "colorscheme onedark
      "colorscheme terafox
      "colorscheme falcon
      "colorscheme NeoSolarized
      "colorscheme cyberdream
      "colorscheme kanagawa
      colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme lackluster-hack
      "colorscheme citruszest
    ]]
  else
    -- nvim -----------------------------------------
    --
    vim.cmd [[
      "colorscheme minicyan
      "colorscheme minischeme
      "colorscheme terafox
      "colorscheme onedark
      "colorscheme falcon
      "colorscheme NeoSolarized
      "colorscheme cyberdream
      "colorscheme kanagawa
      "colorscheme kanagawa-dragon
      "colorscheme fluoromachine
      "colorscheme lackluster-hack
      colorscheme tokyonight-night
    ]]
  end
end

