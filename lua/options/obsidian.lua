require("obsidian").setup({
	workspaces = {
		{
			name = "personal",
			path = "~/.local/share/obsidian_ChK",
		},
	},
	templates = {
		subdir = "Templates",
		date_format = "%Y-%m-%d-%a",
		time_format = "%H:%M",
	},
	daily_notes = {
		folder = "journaling",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		template = nil,
	},
	ui = {
		enable = false,
	},
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
	follow_url_func = function(url)
		vim.fn.jobstart({ "xdg-open", url })
	end,
	wiki_link_func = function(opts)
		if opts.id == nil then
			return string.format("[[%s]]", opts.label)
		elseif opts.label ~= opts.id then
			return string.format("[[%s|%s]]", opts.id, opts.label)
		else
			return string.format("[[%s]]", opts.id)
		end
	end,
})
