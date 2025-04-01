require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"vim",
		"lua",
		"markdown",
		"html",
		"css",
		"javascript",
		"typescript",
		"json",
		"c_sharp",
		"sql",
		"yaml",
		"xml",
		"tsx",
	},
	highlight = {
		enable = true,
	},
})
