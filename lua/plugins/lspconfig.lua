return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "yioneko/nvim-vtsls",
    -- eslint & prettier
    "nvimtools/none-ls.nvim", -- "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/eslint.nvim",
    "MunifTanjim/prettier.nvim",
  },

  cond = not vim.g.vscode,

  lazy = false,
  priority = 100,

  config = function ()
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
    require("lspconfig").vtsls.setup{}

    local handle = io.popen("npm config get prefix")
    local node_prefix = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1") 
    handle:close()

    local global_tsdk_lib = node_prefix .. '/lib/node_modules/@astrojs/language-server/node_modules/typescript/lib'

    if not vim.fn.isdirectory(global_tsdk_lib) then
      print('[lspconfiog/astro] Could not find typescript server path: did you forgot to install @astrojs/language-server npm package?')
    end

    -- print('Using global npm prefix: ' .. node_prefix)
    -- print('Using global tsdk lib path: ' .. global_tsdk_lib)

    local function get_typescript_server_path(root_dir)
      local project_root = vim.fs.dirname(vim.fs.find('node_modules', { path = root_dir, upward = true })[1])

      if project_root then
        local project_tsdk_lib = project_root:gsub("^%s*(.-)%s*$", "%1")  .. '/node_modules/typescript/lib'

        if vim.uv.fs_stat(project_tsdk_lib .. 'typescript.js') then
          -- print('Using local typescript server path: ' .. project_tsdk_lib)
          return project_tsdk_lib
        end
      end

      if vim.fn.isdirectory(global_tsdk_lib) then
        -- print('Using global typescript server path: ' .. global_tsdk_lib)
        return global_tsdk_lib
      end

      return ''
    end

    require("lspconfig").astro.setup{
      -- filetypes = { "astro" },

      init_options = {
        typescript = {
          -- tsdk = "/var/home/spw/.config/nvm/versions/node/v22.13.1/lib/node_modules/@vtsls/language-server/node_modules/typescript/lib",
        },
      },

      on_new_config = function(new_config, new_root_dir)
        if vim.tbl_get(new_config.init_options, 'typescript') and not new_config.init_options.typescript.tsdk then
          new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end
      end,
    }

    vim.lsp.commands["editor.action.showReferences"] = function(command, ctx)
      local locations = command.arguments[3]
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if locations and #locations > 0 then
        local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
        vim.fn.setloclist(0, {}, " ", { title = "References", items = items, context = ctx })
        vim.api.nvim_command("lopen")
      end
    end

    -- eslint & prettier

    local null_ls = require("null-ls")
    local eslint = require("eslint")
    local prettier = require("prettier")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end

        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end
      end,
    })

    eslint.setup({
      bin = 'eslint', -- or `eslint_d`
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = false,
          types = { "directive", "problem", "suggestion", "layout" },
        },
        disable_rule_comment = {
          enable = true,
          location = "separate_line", -- or `same_line`
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = true,
        run_on = "type", -- or `save`
      },
    })

    prettier.setup({
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
      cli_options = {
        arrow_parens = "avoid",
        bracket_spacing = false,
        bracket_same_line = false,
        -- embedded_language_formatting = "auto",
        end_of_line = "lf",
        html_whitespace_sensitivity = "strict",
        -- jsx_bracket_same_line = false,
        -- jsx_single_quote = false,
        -- print_width = 80,
        -- prose_wrap = "preserve",
        quote_props = "as-needed",
        semi = true,
        -- single_attribute_per_line = false,
        single_quote = true,
        -- tab_width = 2,
        trailing_comma = "all",
        -- use_tabs = false,
        -- vue_indent_script_and_style = false,
        experimental_ternaries = "avoid",
        astro_allow_shorthand = true,
        astro_skip_frontmatter = true,
      },
    })

  end,
}
