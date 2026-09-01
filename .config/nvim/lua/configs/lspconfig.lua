require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "basedpyright", "rust_analyzer", "bashls" }
vim.lsp.enable(servers)
vim.diagnostic.config({ signs = true, float = false, virtual_text = false, underline = false })

-- read :h vim.lsp.config for changing options of lsp servers
