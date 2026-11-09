-- noice.nvim — Kommandozeile, Meldungen und Popupmenu in nui-Fenstern.
-- Ohne nvim-notify: alles Kurzlebige geht in den "mini"-View unten rechts.

local opts = {
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

  -- Cmdline-Popup aus der Bildschirmmitte nach unten schieben, horizontal zentriert.
  -- Prozente rechnet nui gegen (Editorhöhe - Popuphöhe): 100% wäre bündig unten.
  views = {
    cmdline_popup = {
      position = {
        row = "80%",
        col = "50%",
      },
    },
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
}

-- Neovide (ab 0.17) hängt sich beim Start vorübergehend mit ext_messages/ext_cmdline
-- an, um Startup-Meldungen selbst einzufangen, und schaltet das erst ~100 ms nach
-- UIEnter wieder ab. noice prüft die UI-Flags synchron in setup(), hält Neovide dann
-- für eine konkurrierende GUI, meldet Fehler (Hit-Enter-Prompt) und startet gar nicht.
-- Deshalb erst einrichten, wenn keine UI mehr ext_* beansprucht. Nach 3 s wird trotzdem
-- eingerichtet: Behält eine GUI die Flags dauerhaft, soll noice das ruhig melden.
local function ui_claims_messages()
  for _, ui in ipairs(vim.api.nvim_list_uis()) do
    if ui.ext_messages or ui.ext_cmdline then
      return true
    end
  end
  return false
end

if vim.g.neovide and ui_claims_messages() then
  local timer = assert(vim.uv.new_timer())
  local deadline = vim.uv.now() + 3000
  timer:start(
    10,
    10,
    vim.schedule_wrap(function()
      if timer:is_closing() then
        return
      end
      if not ui_claims_messages() or vim.uv.now() > deadline then
        timer:close()
        require("noice").setup(opts)
      end
    end)
  )
else
  require("noice").setup(opts)
end

vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Noice: Meldungs-Historie" })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Noice: Meldungen wegwischen" })
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Noice: letzte Meldung" })
