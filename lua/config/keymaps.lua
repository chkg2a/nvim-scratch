local map = vim.keymap.set

-- General
map("n", "zz", "ZZ", { desc = "save and quit" })
map("n", "zq", "ZQ", { desc = "quit" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "j", "gj", { desc = "go down easy" })
map("n", "k", "gk", { desc = "go up easy" })
map("n", "<leader>h", "<cmd>split<cr>", { desc = "Horizontal Split" })
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

local function toggle_diffview()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end

map("n", "gH", toggle_diffview, { desc = "Toggle Diff View" })
map("n", "<leader>ga", "<cmd>Git add %<cr>", { desc = "Open Diff View" })
map("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Open Diff View" })
map("n", "<leader>fg", "<cmd>Neogit<cr>", { desc = "Open Diff View" })

-- File Ex
map("n", "<leader>e", "<cmd>Oil<cr>", {})
map("n", "<leader>E", "<cmd> NvimTreeToggle <CR>", { desc = "Nvim Tree" })

-- Undo Tree
map("n", "<A-u>", "<cmd>UndotreeToggle<cr>", {})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope find files" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fp", "<cmd>Telescope repo list<cr>", { desc = "Telescope live grep" })

-- NeoCodeium
map("n", "<leader>b", "<cmd> NeoCodeium toggle<CR>")

-- ufo
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)

-- RunCode
map("n", "<leader>rr", "<cmd> RunCode <CR>")

-- Search and Replace

function ReplaceChar()
  local char_to_replace = vim.fn.input "Replace: "
  local new_char = vim.fn.input "With: "
  if char_to_replace ~= "" and new_char ~= "" then
    vim.cmd(string.format("s/%s/%s/g", char_to_replace, new_char))
    vim.cmd "nohlsearch"
  end
end

map("n", "<leader>ro", [[:lua ReplaceChar()<CR>]], { noremap = true, silent = false })

map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})

-- AI
map("n", "<leader>ai", "<cmd>CodeCompanionChat<cr>", { desc = "Code Comp" })
map("v", "<leader>ai", "<cmd>CodeCompanionActions<cr>", { desc = "Code Comp" })
map("n", "<leader>n", "<cmd>NeoCodeium toggle<cr>", { desc = "Code Comp" })

-- Harpoon
map("n", "<A-m>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", { desc = "open menu" })
map("n", "<A-q>", "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>", { desc = "go next" })
map("n", "<A-r>", "<cmd>lua require(\"harpoon.mark\").add_file()<cr>", { desc = "add file" })

-- conform
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- obsidian
map("n", "<A-s>", "<cmd> ObsidianSearch <CR>")
map("n", "<A-i>", "<cmd> ObsidianToday <CR>")
map("n", "<A-t>", "<cmd> ObsidianTemplate <CR>")
map("n", "<A-o>", "<cmd> ObsidianOpen <CR>")
map("n", "<A-p>", "<cmd> ObsidianTOC <CR>")
map("n", "<A-b>", "<cmd> ObsidianBacklinks <CR>")
map("n", "<A-n>", "<cmd> ObsidianNew <CR>")
map("n", "<A-t>", "<cmd> OpenTodo <CR>")
