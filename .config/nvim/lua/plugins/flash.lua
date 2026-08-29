return {
	{
		"folke/flash.nvim",
		opts = {},
		keys = {
			{
				"<C-f>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},
}
