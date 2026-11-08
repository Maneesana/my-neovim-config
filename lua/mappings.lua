-- Open terminal in a split with <leader>ter
vim.api.nvim_set_keymap("n", "<leader>ter", ":below10 split | terminal<CR>i", { noremap = true, silent = true })

-- In terminal mode, <Esc> will exit to normal mode
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Toggle formatting on save with <C-u><C-f> (Ctrl+U, then Ctrl+F).
vim.g.format_on_save_enabled = true
vim.keymap.set("n", "<C-u><C-f>", function()
  vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
  vim.notify("Format on save " .. (vim.g.format_on_save_enabled and "enabled" or "disabled"))
end, { desc = "Toggle format on save" })

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format buffer before saving",
  callback = function(args)
    if vim.g.format_on_save_enabled then
      vim.lsp.buf.format { bufnr = args.buf, timeout_ms = 1000 }
    end
  end,
})

-- Multi-cursor config
vim.g.VM_maps = {
  ["Add Cursor Down"] = "<C-S-Down>",
  ["Add Cursor Up"] = "<C-S-Up>",
}
