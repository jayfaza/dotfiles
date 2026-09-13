require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "basedpyright", "rust_analyzer", "bashls", "kdl-lsp" }
vim.lsp.enable(servers)
vim.diagnostic.config({ signs = false, float = false, virtual_text = false, underline = false })

-- read :h vim.lsp.config for changing options of lsp servers
