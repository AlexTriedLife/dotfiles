local map = vim.keymap.set

-- =============================================================================
--  LSP & Coding (Completing your setup)
-- =============================================================================
-- Rename variable under cursor (System wide)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })

-- Code Action (Fix imports, quick fixes, etc.)
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Go to References (Where is this variable used?)
map("n", "gr", function() require('telescope.builtin').lsp_references() end, { desc = "Go to References" })

-- Format current buffer (Essential for C++/Python)
map("n", "<leader>fm", function()
  require("conform").format({ 
    lsp_fallback = true, 
    async = true 
  })
end, { desc = "Format Buffer (Conform)" })

-- =============================================================================
--  Diagnostics (Error Navigation)
-- =============================================================================
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Error" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Error" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Error Message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Error List" })


-- =============================================================================
--  Buffers & Editing
-- =============================================================================
-- Close current buffer (Keep window open)
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-h>", ":bprev<CR>", { desc = "Prev Buffer" })

-- Copy to System Clipboard (Allows pasting outside of Neovim)
map({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to System Clipboard" })


-- =============================================================================
--  Visual Mode Improvements
-- =============================================================================
-- Stay in indent mode when indenting text (So you can Tab/S-Tab multiple times)
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Move highlighted text up and down (Like Alt+Up/Down in VS Code)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Text Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Text Up" })

-- =============================================================================
--  Telescope (Fuzzy Finding) - RESTORED
-- =============================================================================
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })

-- =============================================================================
--  Harpoon v2
-- =============================================================================

map("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: Add File" })

map("n", "<leader>h", function() 
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list()) 
end, { desc = "Harpoon: Menu" })

-- Quick Navigation
map("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon: File 1" })
map("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon: File 2" })
map("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon: File 3" })
map("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon: File 4" })


-- =============================================================================
--  Pro Utils (Quality of Life)
-- =============================================================================

-- 1. Center cursor when scrolling (C-d / C-u)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- 2. Center cursor when searching (n / N)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- 3. Paste without losing clipboard (Leader+p in visual mode)
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting" })

-- 4. Quick Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- 5. Quick Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

