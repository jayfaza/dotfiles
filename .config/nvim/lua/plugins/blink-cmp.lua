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
		opts = {
			keymap = { preset = "default" },
			completion = {
				menu = { auto_show = false },
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
				trigger = {
					show_on_insert = true,
				},
			},
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			signature = { enabled = true },
			fuzzy = { implementation = "prefer_rust" },
		},
	},
}
