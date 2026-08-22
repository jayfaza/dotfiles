
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "rust", "python"
  		},
  	},
  },

  {
    "nvim-mini/mini.misc",
    version = false,
    lazy = false,
    config = function()
      require("mini.misc").setup_termbg_sync()

    end,
  },
{
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerRun",
    "OverseerToggle",
    "OverseerOpen",
    "OverseerClose",
  },
  opts = {
    strategy = {
      "toggleterm",
    },
    templates = { "builtin" },
    task_win = {
      border = "rounded",
    },
  },
  keys = {
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run task" },
    { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle tasks" },
  },
},
{
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  config = function()
    local ufo = require("ufo")

    ufo.setup({
      provider_selector = function(_, filetype, _)
        return { "treesitter", "indent" }
      end,
    })

    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)

    -- peek fold (очень полезно)
    vim.keymap.set("n", "zp", function()
      ufo.peekFoldedLinesUnderCursor()
    end)
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
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash" },
  },
},
{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
},
}
