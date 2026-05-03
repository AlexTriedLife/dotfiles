return {
    'Vigemus/iron.nvim',
    config = function()
        local iron = require("iron.core")

        iron.setup {
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = { "python" },
                repl_definition = {
                    python = {
                        command = { "python3" }
                    },
                },
                -- How the repl window will be displayed
                repl_open_cmd = require('iron.view').right(60),
            },
            -- Keymaps are now handled via iron.core functions for stability
            keymaps = {
                send_motion = "<space>sc",
                visual_send = "<space>sc",
                send_file = "<space>sf",
                send_line = "<space>sl",
                -- Note: 'repl_toggle' is removed from here to fix your error
            },
        }

        -- Manually set the toggle keybinding to avoid the 'repl_toggle' key error
        vim.keymap.set('n', '<space>rt', '<cmd>IronRepl<cr>')
        vim.keymap.set('n', '<space>rs', '<cmd>IronRestart<cr>')
    end
}
