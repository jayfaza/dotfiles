return {
	{
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = {},
		config = function()
			-- default settings
			require("lsp-endhints").setup({
				autoEnableHints = true,
				icons = {
					type = "󰜁 ",
					parameter = "󰏪 ",
					offspec = " ", -- hint kind not defined in official LSP spec
					unknown = " ", -- hint kind is nil
				},
				label = {
					truncateAtChars = 20,
					padding = 1,
					marginLeft = 0,
					sameKindSeparator = ", ",
				},
				extmark = {
					priority = 50,
				},

				hintFormatFunc = nil,
			})
		end,
	},
}
