require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-z>", "<CMD>foldclose<CR>", { desc = "Close code fold" })
vim.keymap.set("n", "<C-o>", "<CMD>foldopen<CR>", { desc = "Open code fold" })
