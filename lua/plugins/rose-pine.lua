return {
  "rose-pine/neovim",
  name = "rose-pine",
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
      },

      styles = {
          bold = true,
          italic = true,
          transparency = false,
      },
    });
  end,
}
