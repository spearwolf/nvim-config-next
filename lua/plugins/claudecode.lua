-- claudecode.nvim — WebSocket-Bridge zur Claude Code CLI
-- Braucht die CLI im PATH (`which claude`); snacks.nvim ist optional,
-- wir bleiben beim eingebauten Terminal.

require("claudecode").setup({
  terminal = {
    provider = "native",
    split_side = "right",
    split_width_percentage = 0.35,
    auto_close = true,
  },
  diff_opts = {
    layout = "vertical",
    auto_resize_terminal = true,
  },
})

local map = vim.keymap.set

map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Claude: Toggle" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Claude: Fokus" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Claude: Session fortsetzen" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Claude: Letzte Session" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Claude: Modell wählen" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Claude: Buffer anhängen" })
map("n", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Claude: Kontext senden" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Claude: Auswahl senden" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Claude: Diff übernehmen" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Claude: Diff verwerfen" })
map("n", "<leader>aq", "<cmd>ClaudeCodeClose<cr>", { desc = "Claude: Terminal schließen" })

-- Im neo-tree-Fenster schickt <leader>as die markierten Dateien statt der Selektion.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function(args)
    map("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", {
      buffer = args.buf,
      desc = "Claude: Datei aus dem Baum anhängen",
    })
  end,
})
