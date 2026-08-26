return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		lazy = "VeryLazy",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = "Lazy",

		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"rust",
				"python",
			},
		},
	},
	{
		"nvim-mini/mini.misc",
		version = true,
		lazy = false,
		config = function()
			require("mini.misc").setup_termbg_sync()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			jump = {
				autojump = true,
			},
		},
		keys = {
			{
				"<C-f>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash",
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = "VeryLazy",
		version = "*",
		config = true,
	},

	{
		"DrKJeff16/boolean-toggle.nvim",
		lazy = "VeryLazy",
		cmd = { "Bool" },
		opts = {},
	},

	{
		"ZhiyuanLck/smart-pairs",
		lazy = "Lazy",
		event = "InsertEnter",
		config = function()
			require("pairs"):setup()
		end,
	},

	{
		"nvim-mini/mini.jump",
		version = "*",
		lazy = "VeryLazy",
	},

	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>",
				backwards_tabkey = "<S-Tab>",
				act_as_tab = true,
				act_as_shift_tab = false,
				default_tab = "<C-t>",
				default_shift_tab = "<C-d>",
				enable_backwards = true,
				completion = false,
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true,
				exclude = {},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
		},
		opt = true,
		event = "InsertCharPre",
		priority = 1000,
	},

	{
		"folke/trouble.nvim",
		lazy = true,
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"Wansmer/treesj",
		lazy = true,
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = true,
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
					},
					include_surrounding_whitespace = false,
				},
			})

			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "as", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
			end)
		end,
	},
	{
		"nvim-mini/mini.surround",
		opts = true,
		lazy = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = false,
	},

	{
		"chrisgrieser/nvim-lsp-endhints",
		lazy = true,
		event = "LspAttach",
		opts = {},
		config = function()
			require("lsp-endhints").setup({
				autoEnableHints = true,
				icons = {
					type = "󰜁 ",
					parameter = "󰏪 ",
					offspec = " ",
					unknown = " ",
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
	{
		"hrsh7th/nvim-cmp",
		enabled = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		lazy = false,

		version = "v0.*",

		opts = {
			keymap = { preset = "default" },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			cmdline = {
				keymap = { preset = "default" },
				completion = {
					menu = { auto_show = false },
					ghost_text = { enabled = true },
				},
			},
			signature = {
				enabled = false,
			},

			completion = {
				keyword = { range = "full" },
				accept = { auto_brackets = { enabled = true } },

				list = { selection = { preselect = false, auto_insert = false } },
				list = {
					selection = {
						preselect = function(ctx)
							return vim.bo.filetype ~= "markdown"
						end,
					},
				},
				menu = {
					auto_show = false,

					draw = {
						columns = {
							{ "label", gap = 1 },
							{ "kind_icon" },
						},
					},
				},

				documentation = { auto_show = false },
				ghost_text = { enabled = true },
			},
		},
		opts_extend = { "source.default" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
	},
	{
		"hiphish/rainbow-delimiters.nvim",

		lazy = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			require("oil").setup()
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
				},
				lsp = {
					progress = {
						enabled = false,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
				signature = {
					enabled = false,
				},
				messages = {
					enabled = false,
				},
				notify = {
					enabled = false,
					view = "notify",
				},
			})
		end,
	},
	{
		"rafamadriz/friendly-snippets",
		lazy = "VeryLazy",
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = "VeryLazy",
	},
	{
		"NvChad/NvChad",
	},
}
