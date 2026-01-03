local map = vim.keymap.set

map("n", "<leader>e", ":Lex 30<cr>", { desc = "Toggle Explorer" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Docs" })
-- Clear search
map("n", "<Esc>", "<cmd>noh<CR>")

-- Error checks
-- prev error
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Error" })
-- next error
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Error" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Error Diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Error List" })


-- Telescop
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
