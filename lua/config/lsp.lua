require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = true,
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    "ts_ls",
    "jsonls",
    "stylua",
    "prettier",
    "goimports",
  },
})

-- Lose Bun-Skripte (Hashbang, kein Projekt drumherum) bekommen über ein tsserver-Plugin
-- @types/bun, siehe ts-plugins/ts-bun-shebang.js. Typen aktualisieren: `bun update` in plugin_root.
if vim.fn.executable("bun") == 1 then
  local plugin_root = vim.fn.stdpath("data") .. "/ts-plugins"
  local plugin_dir = plugin_root .. "/node_modules/ts-bun-shebang"
  vim.fn.mkdir(plugin_dir, "p")
  vim.uv.fs_copyfile(vim.fn.stdpath("config") .. "/ts-plugins/ts-bun-shebang.js", plugin_dir .. "/index.js")

  if not vim.uv.fs_stat(plugin_root .. "/node_modules/@types/bun") then
    if not vim.uv.fs_stat(plugin_root .. "/package.json") then
      vim.fn.writefile({ '{ "private": true }' }, plugin_root .. "/package.json")
    end
    vim.system({ "bun", "add", "--dev", "@types/bun" }, { cwd = plugin_root }, function(out)
      vim.schedule(function()
        if out.code == 0 then
          vim.notify("@types/bun installiert, für offene Bun-Skripte :lsp restart ts_ls")
        else
          vim.notify("bun add @types/bun fehlgeschlagen:\n" .. out.stderr, vim.log.levels.ERROR)
        end
      end)
    end)
  end

  vim.lsp.config("ts_ls", {
    init_options = { plugins = { { name = "ts-bun-shebang", location = plugin_root } } },
  })
end

-- vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)

local icons = require("config.diagnostic-icons")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.error,
      [vim.diagnostic.severity.WARN] = icons.warn,
      [vim.diagnostic.severity.INFO] = icons.info,
      [vim.diagnostic.severity.HINT] = icons.hint,
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
