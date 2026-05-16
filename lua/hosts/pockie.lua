if not vim.g.vscode then
  if vim.g.neovide then
    vim.cmd([[
      let g:neovide_fullscreen = v:true
      let g:neovide_transparency = 0.93
      let g:neovide_cursor_animate_in_insert_mode = v:true

      set guifont=JetBrainsMono\ Nerd\ Font,Noto_Color_Emoji:h14

      "colorscheme tokyonight-night
      "colorscheme vague
    ]])
    vim.cmd.colorscheme("fluoromachine")
  else
    -- vim.cmd([[
    --   "colorscheme tokyonight-night
    --   colorscheme fluoromachine
    -- ]])
    require("onedark").load()
  end
end
