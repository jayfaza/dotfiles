return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			win = {
				padding = { 0, 0, 150, 0 },
				no_overlap = true,
				title = false,
				title_pos = "right",
			},
			layout = {
				width = { max = 8 },
				height = { max = 8 },
			},
		},
	},
}
