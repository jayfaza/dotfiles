return {
	{
		"ZhiyuanLck/smart-pairs",
		lazy = "Lazy",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup()
		end,
	},
}
