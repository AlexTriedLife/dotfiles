return {
  {
    "folke/lazydev.nvim",
    ft = "lua", 
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", 
    },
    config = function()
      -- Initialize Mason
      require("mason").setup()

      local servers = {
        clangd = {},     
        basedpyright = {},
        marksman = {},
        jsonls = {},
        vimls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
      }

      -- Mason config
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            
            -- Enable cmp completion for lsps
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})

            -- Setup the server
            require("lspconfig")[server_name].setup(server_opts)
          end,
        },
      })
    end,
  },
}
