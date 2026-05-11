# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal Neovim configuration, hand-built on top of [lazy.nvim](https://lazy.folke.io/) (replaces a previous LazyVim-based setup). It is also designed to work as the Neovim backend for VSCode's Neovim extension.

## Bootstrap & dependencies

- Clone into `$HOME/.config/nvim`. `lazy.nvim` self-bootstraps from `lua/config/lazy.lua` on first run.
- Required global npm packages (LSP / RPC bridge):
  ```sh
  npm i -g neovim @vtsls/language-server
  ```
- Most LSP servers (`vtsls`, `lua_ls`, `astro`, `eslint`, `tailwindcss`, `ts_ls`) are auto-installed via `mason-lspconfig` (`ensure_installed` + `automatic_installation`). External CLIs `eslint` (via `none-ls` + `MunifTanjim/eslint.nvim`) and `prettier` (via `conform.nvim`) must be resolvable on `PATH`.
- Tree-sitter parsers are managed by `romus204/tree-sitter-manager.nvim` (see `lua/plugins/tree-sitter-manager.lua`). It needs the `tree-sitter` CLI, `git`, and a C compiler (`gcc`/`clang`) on `PATH` to compile parsers. With `auto_install = true`, missing parsers are fetched lazily; `:TSManager` opens the UI (i/x/u/r/q).
- `lazy-lock.json` is gitignored — plugin versions are not pinned in this repo.

## Load order & entry points

`init.lua` orchestrates startup in this exact order; treat it as the canonical map:

1. `lua/config/common.lua` — leader = `,` (also localleader), disables netrw, sources `vim/common.vim` (foldmethod, indent, splitting, search, clipboard rules).
2. `lua/config/lazy.lua` — bootstraps `lazy.nvim`, then `{ import = "plugins" }` auto-loads every file under `lua/plugins/*.lua`.
3. `lua/utils.lua` — defines a **global** `get_hostname()` (uses `vim.uv.os_gethostname()`, returns the short hostname before the first `.`).
4. `lua/hosts/<hostname>.lua` if present, otherwise `lua/hosts/default.lua` — per-machine overrides (mostly colorscheme / neovide settings). When adding a new machine, create `lua/hosts/<short-hostname>.lua`.
5. `vim/keys.vim` — function-key mappings (F3 NvimTree, F4 Aerial, F6 Telescope noice, F8 LspRestart), tab nav, copy/paste, `<leader>s` Sneak.
6. Tail of `init.lua` — branches on `vim.g.vscode`: VSCode mode loads `lua/config/vscode.lua` only; standalone Neovim loads `lua/config/markdown.lua`, illuminate-based `<F7>/<S-F7>` reference navigation, and Copilot `<C-Right>` accept binding.

## Two execution modes

The entire config is dual-target. Always preserve this split when adding plugins or keymaps:

- **Standalone Neovim / Neovide** — full plugin set, LSP, statusline, file tree, etc. Neovide is detected via `vim.g.neovide` (used inside `lua/hosts/*.lua` for GUI-only options like `guifont`, `neovide_opacity`).
- **VSCode-Neovim** — when `vim.g.vscode` is truthy. Plugins that don't make sense inside VSCode are gated with `cond = not vim.g.vscode` in their spec (see `lspconfig.lua`, `mason.lua`, `lualine.lua`, etc.). `vim/common.vim` and `init.lua` also branch on `exists('g:vscode')` / `vim.g.vscode` for buffer behavior (no signcolumn, no scrolloff, system clipboard, marker folds instead of treesitter folds).

When adding a new plugin spec, decide explicitly whether it should run in VSCode mode and set `cond` accordingly.

## LSP architecture

`lua/plugins/lspconfig.lua` is the central LSP entry point (`lazy = false`, `priority = 100` so it loads before `mason.lua` at priority 90). Notable specifics:

- Uses Neovim 0.11+ `vim.lsp.config(...)` / `vim.lsp.enable(...)` API, not the legacy `lspconfig.<server>.setup{}` form.
- `astro` server resolves its `tsdk` dynamically via `get_typescript_server_path(root_dir)`: prefers project-local `node_modules/typescript/lib`, falls back to the global npm prefix's `typescript/lib`. If you change TS resolution, update this function.
- `clangd` is configured with `offsetEncoding = utf-16` to avoid mixed-encoding warnings.
- ESLint code actions & diagnostics run through `none-ls` + `MunifTanjim/eslint.nvim` (configured in `lspconfig.lua`).
- Prettier formatting is handled by `conform.nvim` (`lua/plugins/conform.lua`). The `prepend_args` list there is the source of truth for formatting style — edit CLI flags there, not in a `.prettierrc`.
- `<Leader>f` formats the buffer via `conform.format({ async = true, lsp_format = "fallback" })`.
- `<leader>rn` rename, `<leader>ca` code action — set in `init.lua`, not in `lspconfig.lua`.

## Style & encoding

`.editorconfig` enforces 2-space indent, LF, UTF-8, final newline. `vim/common.vim` re-asserts the same (`tabstop=2`, `expandtab`, `fileformat=unix`). Match these in any new Lua/Vimscript file.

## Commit conventions

`git log` shows short, lowercase, imperative subject lines (`update`, `fix hostname detection`, `update lualine theme`). No body, no prefix tags. Follow that style.
