require "nvchad.autocmds"

vim.api.nvim_create_augroup("LspInlayHints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspInlayHints",
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})
