# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Persönliche Neovim-Konfiguration (v0.12+). Kein Build, keine Tests, kein Linter — die »Testsuite« ist ein Neustart von Neovim.

## Verifizieren

```bash
nvim --headless '+qa'          # lädt die komplette Config, Fehler landen auf stderr
nvim -c 'checkhealth' -c 'only'
nvim --headless -c 'lua vim.pack.update()' -c 'qa'   # Plugins aktualisieren
```

Plugin-API ist `vim.pack` (Neovim-Core, kein lazy.nvim/packer): `add`, `get`, `update`, `del`.
`nvim-pack-lock.json` ist bewusst gitignored — Versionen werden nicht eingefroren.

## Aufbau

Ein einziger Ladepfad, kein Lazy-Loading, keine Spec-Tabellen. `init.lua` arbeitet strikt von oben nach unten:

1. Leader (`,`) setzen, `common.vim` sourcen
2. `vim.pack.add({...})` — die vollständige Plugin-Liste, eine flache Tabelle
3. Setup der Colorschemes, die Optionen brauchen (onedark, fluoromachine, cyberdream)
4. Host-Override: `pcall(require, "hosts." .. hostname)`
5. `require("plugins.*")` / `require("config.lsp")`
6. Globale Keymaps (Lua-Block + ein `vim.cmd([[...]])`-Heredoc mit Vimscript-Mappings)

### Die VSCode-Klammer

Ab Zeile 20 liegt alles in `if not vim.g.vscode then ... end`. Unter der VSCode-Neovim-Extension existieren nur Leader, `common.vim` und eine Handvoll Optionen. Neuer Code gehört fast immer *in* die Klammer; `common.vim` verzweigt zusätzlich selbst über `exists('g:vscode')` (Folding, Scrolloff, Clipboard).

### Host-Overrides

`lua/hosts/<hostname>.lua`, wobei der Hostname bis zum ersten Punkt gekürzt wird. Schlägt das `pcall` fehl, greift der Default-Zweig in `init.lua` mit GUI-Einstellungen und Colorscheme. Existiert die Host-Datei, läuft der Default-Zweig **gar nicht** — die Host-Datei muss Neovide-Optionen und Colorscheme selbst vollständig setzen. Aktuell nur `pockie.lua`.

### `lua/plugins/*.lua`

Eine Datei pro Plugin, ohne Rückgabewert: Die Datei ruft beim `require` direkt `setup()` auf und registriert ihre eigenen Keymaps (`aerial.lua` → `<F2>`). Eine Datei ist nur aktiv, wenn `init.lua` sie explizit requiert — eine Datei in `lua/plugins/`, die dort fehlt, ist tot und nicht etwa lazy geladen.

### LSP

`lua/config/lsp.lua` ist die gesamte LSP-Schicht: mason + `mason-lspconfig` mit `automatic_enable = true` + `mason-tool-installer.ensure_installed`. Es gibt keine per-Server-Konfiguration; ein neuer Server wird durch einen Eintrag in `ensure_installed` hinzugefügt und automatisch aktiviert. Für abweichende Einstellungen `vim.lsp.config()` in derselben Datei ergänzen.

Die Diagnostic-Icons (💥 💀 🐸 👻) stehen einmal in `lua/config/diagnostic-icons.lua`. `config/lsp.lua` mappt sie auf die Severity-Enums für die Signs, `plugins/corn.lua` reicht die Tabelle unverändert durch.

### Formatierung

conform.nvim mit `format_on_save` (500 ms, `lsp_format = "fallback"`), manuell `<C-S-i>`. JS/TS/JSON laufen über **biome** samt Import-Sortierung, Go über `gofmt`, Rust über `rustfmt`. Lua steht nicht in `formatters_by_ft` — obwohl stylua per mason installiert wird, formatiert lua_ls über den Fallback. Für Lua-Dateien in diesem Repo gilt der stylua-Stil des Bestands: doppelte Anführungszeichen, 2 Spaces, LF (siehe `.editorconfig`).

## Konventionen

- Completion: blink.cmp mit `preset = "enter"`; `<Tab>`/`<S-Tab>` sind bewusst auf `false` gesetzt, damit copilot.vim Tab behält. Nicht »reparieren«.
- Keymaps verteilen sich auf drei Orte: Lua-Block in `init.lua`, Vimscript-Heredoc in `init.lua`, Plugin-Dateien. Neue globale Mappings in den Lua-Block, nicht ins Heredoc.
- Kommentare sind gemischt deutsch/englisch; auskommentierte Colorscheme-Zeilen sind ein bewusster Vorrat zum Durchprobieren, kein toter Code zum Aufräumen.
