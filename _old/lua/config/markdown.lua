local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {'*.md'},
  group = group,
  -- command = 'setlocal wrap'
  callback = function()
    vim.cmd('setlocal wrap')
    vim.cmd('setlocal nonumber')
    vim.cmd('setlocal foldmethod=expr')
    vim.cmd('setlocal foldexpr=v:lua.vim.treesitter.foldexpr()')
  end,
})
