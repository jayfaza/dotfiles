require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

vim.keymap.set("n", "gK", function()
	local float = not vim.diagnostic.config().float
	local text = not vim.diagnostic.config().virtual_text

	vim.diagnostic.config({ float = float, virtual_text = text })
end)

vim.keymap.set("n", "gU", function()
	local underline = not vim.diagnostic.config().underline

	vim.diagnostic.config({ underline = underline })
end)

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
