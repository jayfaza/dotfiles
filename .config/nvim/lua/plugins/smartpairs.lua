return {
	{
		"ZhiyuanLck/smart-pairs",
		lazy = "VeryLazy",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup()
		end,
	},
}
