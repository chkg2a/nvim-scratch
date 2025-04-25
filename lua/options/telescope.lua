require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"^%.",
			"assets/",
		},
	},
	extensions = {
		repo = {
			list = {
				fd_opts = {
					"--no-ignore-vcs",
				},
				search_dirs = {
					"~/projects",
					"~/.local/share/clone",
					"~/.local/share/obsidian_ChK",
					"~/.config/",
				},
			},
		},
	},
})
require("telescope").load_extension("repo")
