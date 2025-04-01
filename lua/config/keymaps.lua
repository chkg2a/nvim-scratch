local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "j", "gj", { desc = "go down easy" })
map("n", "k", "gk", { desc = "go up easy" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Virtical Split" })
map({ "n", "t" }, "<C-l>", "<C-w>l", { desc = "window left panel" })
map({ "n", "t" }, "<C-h>", "<C-w>h", { desc = "window right panel" })
map({ "n", "t" }, "<A-l>", "<C-w>l", { desc = "window left panel" })
map({ "n", "t" }, "<A-h>", "<C-w>h", { desc = "window right panel" })
map({ "n", "t" }, "<A-j>", "<C-w>j", { desc = "window up panel" })
map({ "n", "t" }, "<A-k>", "<C-w>k", { desc = "window down panel" })
map({ "n", "t" }, "<A-S-h>", "<cmd>2winc > <cr>", { desc = "increase window left panel" })
map({ "n", "t" }, "<A-S-l>", "<cmd>2winc < <cr>", { desc = "increase window right panel" })
map("n", "<Esc>", function()
    if vim.v.hlsearch == 1 then
        vim.cmd("noh")
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    end
end, { silent = true, desc = "Smart clear search highlights" })

-- Git Stuffs
map("n", "gh", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Next hunk" })
map("n", "gH", "<cmd>DiffViewOpen<cr>", { desc = "Open Diff View" })
map("n", "ga", "<cmd>Git add %<cr>", { desc = "Open Diff View" })
map("n", "gc", "<cmd>Git commit<cr>", { desc = "Open Diff View" })

-- File Ex
map("n", "<leader>e", "<cmd>Oil<cr>", {})

-- Undo Tree
map("n", "<A-u>", "<cmd>UndotreeToggle<cr>", {})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- NeoCodeium
map("n", "<leader>b", "<cmd> NeoCodeium toggle<CR>")

-- ufo
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)

-- spectre
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})

-- conform
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })
