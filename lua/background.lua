-- Dim all text slightly, leaving terminal image visible
local blend_amount = 20 -- 0 = normal, 100 = full blend with background
local groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "VertSplit",
  "StatusLine",
  "LineNr",
  "NonText",
  "CursorLineNr",
  "Pmenu",
  "PmenuSel",
  "TabLineFill",
  "TabLineSel",
  "TabLine",
  "EndOfBuffer",
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "none", blend = blend_amount })
end
