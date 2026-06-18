return function()
	require("blink.cmp").setup({
		keymap = {
			preset = "default",

			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.accept()
					end
				end,
				"fallback",
			},

			["<C-k>"] = {
				function(cmp)
					cmp.scroll_documentation_up(4)
				end,
			},

			["<C-j>"] = {
				function(cmp)
					cmp.scroll_documentation_down(4)
				end,
			},
		},

		completion = {
			documentation = {
				auto_show = false,
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	})
end
