return {
	{
		"saghen/blink.cmp",
		event = "LspAttach",
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		lazy = false,
		opts = {
			keymap = { preset = "default" },
			completion = {
				menu = { auto_show = false },
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
			},
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			signature = { enabled = false },
		},
	},
}
