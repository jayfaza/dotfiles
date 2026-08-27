return {
  "Wansmer/treesj",
  keys = { "<space>m", "<space>j", "<space>s" },
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  lazy = false,
  config = function()
    require("treesj").setup {--[[ your config ]]
    }
  end,
}
