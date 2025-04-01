return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = function()
			require("options.neogit")
		end,
	},
	{ "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("options.hlchunk")
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("options.conform")
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
		},
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
		},
		lazy = false,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("options.catppuccin")
		end,
		priority = 1000,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("options.mini")
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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("options.lspconfig")
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
			require("options.startup")
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
		config = function()
			require("options.treesitter")
		end,
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
			require("options.code_runner")
		end,
		cmd = "RunCode",
	},
}
