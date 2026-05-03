return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered({
          max_height = 15,  -- Limit height to 15 items
          max_width = 60,   -- Limit width
        }),
        documentation = cmp.config.window.bordered({
          max_height = 15,
          max_width = 80,
        }),
      },

      -- Compact formatting
      formatting = {
        fields = { "kind", "abbr", "menu" },  -- Reorder: icon first, then text
        format = function(entry, vim_item)
          local icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
          }

          -- Set icon only (no kind text)
          vim_item.kind = icons[vim_item.kind] or ""

          -- Truncate long completion items
          local max_width = 50
          if #vim_item.abbr > max_width then
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
          end

          -- Shorter source labels
          vim_item.menu = ({
            nvim_lsp = "LSP",
            luasnip = "Snip",
            buffer = "Buf",
            path = "Path",
          })[entry.source.name]

          return vim_item
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),  -- Scroll UP
        ["<C-d>"] = cmp.mapping.scroll_docs(4),   -- Scroll DOWN
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Don't auto-select first item

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Strict filtering to reduce noise
      sources = cmp.config.sources({
        { 
          name = "nvim_lsp", 
          priority = 1000,
          max_item_count = 20,  -- Limit LSP suggestions
          keyword_length = 1,
        },
        { 
          name = "luasnip", 
          priority = 750,
          max_item_count = 5,   -- Only show top 5 snippets
          keyword_length = 2,
        },
        { 
          name = "path", 
          priority = 500,
          max_item_count = 10,
          keyword_length = 2,
        },
      }, {
        { 
          name = "buffer", 
          priority = 250,
          max_item_count = 10,  -- Limit buffer completions
          keyword_length = 4,   -- Only trigger after 4 chars
        },
      }),

      -- Better performance
      performance = {
        debounce = 100,        -- Wait 100ms before showing (less flickering)
        throttle = 50,
        fetching_timeout = 200,
        max_view_entries = 20, -- Show max 20 items at once
      },

      -- Matching behavior
      matching = {
        disallow_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = true, -- Must match from start
      },

      -- Less aggressive ghost text
      experimental = {
        ghost_text = {
          hl_group = "Comment", -- Make it subtle
        },
      },

      -- Completion behavior
      completion = {
        completeopt = "menu,menuone,noinsert,noselect", -- Don't auto-insert
        keyword_length = 2, -- Only trigger after 2 characters
      },
    })
  end,
}
