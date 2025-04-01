require("mini.statusline").setup()
require("mini.move").setup()
require("mini.diff").setup({
	{
		mappings = {
			apply = "",
			reset = "",
			textobject = "",
			goto_first = "",
			goto_prev = "",
			goto_next = "",
			goto_last = "",
		},
	},
})
require("mini.git").setup()
