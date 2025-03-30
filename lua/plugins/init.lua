return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					css = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					cpp = { "clang-format" },
					python = { "autoflake" },
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
		},
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.statusline").setup()
			require("mini.move").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
	},
	{
		"nvim-focus/focus.nvim",
		version = false,
		opts = {},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"f-person/git-blame.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "config.lspconfig"
		end,
	},

	{
		"startup-nvim/startup.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("startup").setup({
				theme = "startify",
			})
			vim.g.startup_bookmarks = {
				["N"] = "~/.config/nvim/lua/plugins/init.lua",
				["C"] = "~/projects/college-programs/datasOnServer/",
				["W"] = "~/projects/websites/chill/",
				["D"] = "~/.local/share/clone/dwm/config.h",
				["A"] = "~/.local/bin/",
				["f"] = ".",
			}
		end,
		event = "BufWinEnter",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "VeryLazy", -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
		init = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
		end,
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
		cmd = "Spectre",
	},
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<A-cr>", neocodeium.accept)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "markdown", "markdown_inline" },
					highlight = {
						enable = true,
					},
				})
			end,
		},
		lazy = false,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				},
				sources = { { name = "nvim_lsp" } },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		lazy = false,
	},

	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				filetype = {
					c = {
						"cd '$dir' &&",
						"gcc $fileName -o out.$fileNameWithoutExt -Ofast -march=native &&",
						"/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
						"echo '' &&",
						"cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
						"rm ./out.$fileNameWithoutExt &&",
						"rm ./memUsage.txt",
					},
					java = {
						"cd '$dir' &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt &&",
						"rm *.class &&",
					},
					cpp = {
						"cd '$dir' &&",
						"g++ $fileName -std=c++23 -o out.$fileNameWithoutExt -Ofast -march=native -lfn&&",
						"/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
						"echo '' &&",
						"cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
						"rm ./out.$fileNameWithoutExt &&",
						"rm ./memUsage.txt",
					},
					python = "python3 -u",
				},
			})
		end,
		cmd = "RunCode",
	},
}
