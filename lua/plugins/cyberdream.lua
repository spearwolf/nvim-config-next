return {
  "scottmckendry/cyberdream.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  priority = 1000,
  opts = {
    -- Set light or dark variant
    variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

    -- Enable transparent background
    transparent = true,

    -- Reduce the overall saturation of colours for a more muted look
    saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

    -- Enable italics comments
    italic_comments = true,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Modern borderless telescope theme
    -- borderless_telescope = false,
    borderless_pickers = true,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
    -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
    -- cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
        notify = true,
        mini = true,
        -- ...
    },
  },
  keys = {
    {
      "<leader>cd",
      ":CyberdreamToggleMode<CR>",
      desc = "Toggle cyberdream theme",
    },
  },
}
