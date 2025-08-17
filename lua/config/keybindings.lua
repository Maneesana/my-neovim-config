vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ter", ":below 10split term://$SHELL<CR>i", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
