require("codecompanion").setup({
	display = {
		chat = {
			auto_scroll = false,
		},
	},
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = vim.fn.getenv("GEMINI_API_KEY"),
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "gemini",
			keymaps = {
				send = {
					modes = { n = ";", i = "<C-s>" },
				},
				close = {
					modes = { n = "<C-c>", i = "<C-c>" },
				},
			},
		},
		inline = {
			adapter = "gemini",
		},
		cmd = {
			adapter = "gemini",
		},
	},
})
