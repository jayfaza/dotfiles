require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

vim.keymap.set("n", "gK", function()
	local float = not vim.diagnostic.config().float
	local lines = not vim.diagnostic.config().virtual_lines

	vim.diagnostic.config({ float = float, virtual_lines = lines })
end)

vim.keymap.set("n", "gU", function()
	local underline = not vim.diagnostic.config().underline

	vim.diagnostic.config({ underline = underline })
end)

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
