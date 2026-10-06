-- Luft um Headlines und Tabellen: virtuelle Leerzeilen, die den Abstand auf ein Minimum auffüllen.
-- Echte Leerzeilen im Text zählen mit, es wird nur die Differenz ergänzt.
local block_space = {
  heading = { above = 2, below = 1 },
  table = { above = 1, below = 1 },
}
local block_query = vim.treesitter.query.parse(
  "markdown",
  "[(atx_heading) (setext_heading)] @heading (pipe_table) @table"
)

local function is_blank(buf, row)
  local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]
  return line ~= nil and line:match("^%s*$") ~= nil
end

local function blank_lines(n)
  local lines = {}
  for i = 1, n do
    lines[i] = { { "", "Normal" } }
  end
  return lines
end

-- Nach GFM gehört Text direkt unter einer Tabelle noch zu ihr; render-markdown verwirft solche
-- Zeilen ohne Pipes und zeichnet den Rand davor. Das Tabellenende ist also die letzte Zeile mit '|'.
local function table_last_row(node)
  local last
  for child in node:iter_children() do
    if child:type() == "pipe_table_header" or child:type() == "pipe_table_row" then
      for grandchild in child:iter_children() do
        if grandchild:type() == "|" then
          last = child:start()
          break
        end
      end
    end
  end
  return last
end

local function block_spacing(ctx)
  local buf = ctx.buf
  local line_count = vim.api.nvim_buf_line_count(buf)
  -- Lücken zwischen zwei nicht-leeren Zeilen, geschlüsselt nach der oberen Zeile. Stoßen zwei
  -- Blöcke aneinander (Headline direkt über Tabelle), zählt der größere Wunsch, nicht die Summe.
  local gaps = {} ---@type table<integer, { next: integer, need: integer }>
  -- Zeilen, unter die keine virtuellen Zeilen gehören (siehe unten)
  local no_lines_below = {} ---@type table<integer, true>

  local function request(prev, next, need)
    local gap = gaps[prev]
    if gap then
      gap.need = math.max(gap.need, need)
    else
      gaps[prev] = { next = next, need = need }
    end
  end

  for id, node in block_query:iter_captures(ctx.root, buf) do
    local kind = block_query.captures[id]
    local space = block_space[kind]
    local start_row, _, end_row, end_col = node:range()
    -- der Knoten endet meist auf Spalte 0 der Folgezeile
    local last_row = end_col == 0 and end_row - 1 or end_row
    if kind == "table" then
      last_row = table_last_row(node) or last_row
    end
    if kind == "table" or last_row > start_row then
      no_lines_below[last_row] = true
    end

    -- ganz oben im Puffer wären virtuelle Zeilen über Zeile 1 nur per <C-y> sichtbar
    local prev = start_row - 1
    while prev >= 0 and is_blank(buf, prev) do
      prev = prev - 1
    end
    if prev >= 0 then
      request(prev, start_row, space.above)
    end

    local next = last_row + 1
    while next < line_count and is_blank(buf, next) do
      next = next + 1
    end
    if next < line_count then
      request(last_row, next, space.below)
    end
  end

  local marks = {}
  for prev, gap in pairs(gaps) do
    local missing = gap.need - (gap.next - prev - 1)
    if missing > 0 then
      -- Unter einer Tabelle hängt schon ihr virtueller Rand, und die '---'-Zeile einer Setext-Headline
      -- blendet render-markdown samt allem, was daran hängt, aus. In beiden Fällen gehen die
      -- Leerzeilen an die Folgezeile.
      local attach_next = no_lines_below[prev] or false
      -- conceal = false: die Zeilen bleiben auch stehen, wenn der Cursor auf dem Block steht,
      -- sonst springt das Layout bei jeder Cursorbewegung
      marks[#marks + 1] = {
        conceal = false,
        start_row = attach_next and gap.next or prev,
        start_col = 0,
        opts = { virt_lines = blank_lines(missing), virt_lines_above = attach_next },
      }
    end
  end
  return marks
end

require("render-markdown").setup({
  heading = {
    -- keine farbigen Balken über die ganze Zeilenbreite; Vordergrundfarbe + Sign reichen
    backgrounds = {},
    -- die '#'s verschwinden ersatzlos, nur ein Leerzeichen bleibt als Einzug —
    -- inline, weil overlay je nach Ebene unterschiedlich weit einrücken würde
    icons = { " " },
    position = "inline",
    -- sign_text erlaubt max. 2 Zellen — das Emoji füllt sie allein, daher ohne Leerzeichen
    signs = { "📑" },
  },
  pipe_table = {
    -- Rand immer als eigene virtuelle Zeile, statt eine echte Leerzeile damit zu überschreiben —
    -- sonst frisst der Rand genau den Abstand, den block_spacing herstellen soll
    border_virtual = true,
  },
  custom_handlers = {
    markdown = { extends = true, parse = block_spacing },
  },
})

-- Fließtext umbrechen statt horizontal scrollen (global gilt nowrap, siehe common.vim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
