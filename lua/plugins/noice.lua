-- noice.nvim — Kommandozeile, Meldungen und Popupmenu in nui-Fenstern.
-- Ohne nvim-notify: alles Kurzlebige geht in den "mini"-View unten rechts.

require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
  },

  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "messages",
    view_search = "virtualtext",
  },

  popupmenu = {
    enabled = true,
    backend = "nui",
  },

  notify = {
    enabled = true,
    view = "mini",
  },

  -- LSP-Overrides bleiben aus: hover/signature kommen weiterhin von nvim,
  -- Diagnostics gehören corn.nvim. noice fasst hier nichts an.
  lsp = {
    hover = { enabled = false },
    signature = { enabled = false },
    message = { enabled = false, view = "mini" },
    progress = { enabled = true, view = "mini" },
  },

  presets = {
    bottom_search = true,
    long_message_to_split = true,
  },
})

vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Noice: Meldungs-Historie" })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Noice: Meldungen wegwischen" })
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Noice: letzte Meldung" })
