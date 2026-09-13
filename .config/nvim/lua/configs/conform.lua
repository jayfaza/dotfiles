local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		rust = { "rustfmt" },
		bash = { "shfmt" },
	},

}

return options
