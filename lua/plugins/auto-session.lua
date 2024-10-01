return {
  'rmagatti/auto-session',
  lazy = false,
  cond = not vim.g.vscode,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = {
      '~/',
      'C:\\Users\\wolfg',
      '~/spaceland',
      'D:\\spaceland',
      '~/work',
      'D:\\work',
      '~/Downloads',
      '/',
    },
    -- log_level = 'debug',
  }
}
