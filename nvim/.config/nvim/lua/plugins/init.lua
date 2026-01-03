return {
    -- Theme
  { 
    "rebelot/kanagawa.nvim", 
    priority = 1000, -- Load before everything else
    config = function() 
      vim.cmd("colorscheme kanagawa") 
    end 
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true, 
    },
  },

  -- Auto pair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- Load with default settings
  },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
}
