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
map("n", "<leader>s", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- conform
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })
