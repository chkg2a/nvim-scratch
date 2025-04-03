require("cord").setup({
	idle = {
		enabled = true,
		details = function(opts)
			return string.format("Taking a break from %s", opts.workspace)
		end,
		timeout = 300000,
	},
	buttons = {
		{
			label = function(opts)
				return opts.repo_url and "View Repository" or "View cord.nvim"
			end,
			url = function(opts)
				return opts.repo_url or "https://github.com/vyfor/cord.nvim"
			end,
		},
	},
	text = {
		editing = function(opts)
			local text = "Editing " .. opts.filename
			if vim.bo.modified then
				text = text .. "[+]"
			end
			return text
		end,
	},
})
