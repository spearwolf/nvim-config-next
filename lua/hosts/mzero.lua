if not vim.g.vscode then
  if vim.g.neovide then
    vim.cmd([[
      let g:neovide_fullscreen = v:true
      let g:neovide_opacity = 0.93
      let g:neovide_cursor_animate_in_insert_mode = v:true

      set guifont=JetBrainsMono\ Nerd\ Font,Apple_Color_Emoji:h14

      "colorscheme tokyonight-night
      "colorscheme vague
    ]])
    -- vim.cmd.colorscheme("fluoromachine")
    -- vim.cmd.colorscheme("catppuccin")
    vim.cmd.colorscheme("vague")
  else
    -- vim.cmd([[
    --   "colorscheme tokyonight-night
    --   colorscheme fluoromachine
    -- ]])
    require("onedark").load()
  end
end
