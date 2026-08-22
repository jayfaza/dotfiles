require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<F5>", function()
  require("overseer").run_template({ name = "Run file" })
end, { desc = "Run project (Overseer)" })

vim.g.diagnostics_enabled = true

function ToggleDiagnostics()
    vim.g.diagnostics_enabled = not vim.g.diagnostics_enabled
    if vim.g.diagnostics_enabled then
        vim.diagnostic.enable(true)
    else
        vim.diagnostic.enable(false)
    end
end

vim.keymap.set("n", "<C-d>", function()
    ToggleDiagnostics()
end, { desc = "Toggle diagnostics" })
