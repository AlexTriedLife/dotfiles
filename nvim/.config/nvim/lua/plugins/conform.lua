return {
    -- 1. Automate installing 'black' via Mason
    {
        "whoissethdaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "black", -- Python formatter
                    -- "isort", -- (Optional) Sorts imports
                },
            })
        end,
    },

    -- 2. Configure the formatting engine
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    -- Use "isort" and "black" sequentially if you want import sorting too
                    python = { "black" },
                },

                -- Enable "Format on Save"
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 500,
                },
            })
        end,
    },
}
