if not vim.g.vscode then
  return
end

vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])

-- vim.keymap.set("n", "<A-n>", [[<cmd>call VSCodeCall("editor.action.wordHighlight.next")<cr>]])
-- vim.keymap.set("n", "<A-p>", [[<cmd>call VSCodeCall("editor.action.wordHighlight.prev")<cr>]])

