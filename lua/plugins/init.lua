return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = {
					vim.fn.stdpath("config") .. "/snippets",
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
		config = function()
			require("options.nvim-tree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"neovim-treesitter/treesitter-parser-registry",
		},
		config = function()
			require("options.nvim-treesitter")() -- 👈 IMPORTANT ()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		config = function()
			require("options.blink")()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			require("options.harpoon")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",         mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "<leader>s", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "<leader>S", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	-- {
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup({})
	-- 	end,
	-- },
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		opts = {},
	},
	{ "krady21/compiler-explorer.nvim", cmd = "CECompile" },
	{ "cljoly/telescope-repo.nvim" },
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		config = function()
			require("options.cord")
		end,
		event = "VeryLazy",
	},
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
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("options.telescope")
		end,
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
	-- {
	--   "wakatime/vim-wakatime",
	--   event = "VeryLazy",
	-- },
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				enabled = false, -- 👈 important
			})

			vim.keymap.set("i", "<A-y>", neocodeium.accept)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
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
		cmd = { "RunCode" },
	},
	{
		dir = "~/.config/nvim/lua/gitroot", -- wherever you put it
		config = function()
			require("gitroot").setup()
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		event = "VeryLazy",
		-- lazy = true,
		-- ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("options.obsidian")
		end,
	},
	{
		"chkg2a/todo-obsidian.nvim",
		lazy = false, -- load on startup
		priority = 100, -- load early if needed
		opts = {
			file_paths = {
				main_todo = vim.fn.expand("~/GoodStuffs/obsidian_ChK/journaling/todos/TODO.md"),
			},
		},
		config = function(_, opts)
			require("todo-obsidian").setup(opts)
		end,
	},
	{
		"KashifKhn/remove-comments",
		config = function()
			require("nvim-remove-comments").setup()
		end,
		lazy = false,
	},
	-- {
	--   "benlubas/molten-nvim",
	--   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	--   build = ":UpdateRemotePlugins",
	--   init = function()
	--     -- this is an example, not a default. Please see the readme for more configuration options
	--     vim.g.molten_output_win_max_height = 12
	--   end,
	-- },
	-- {
	--   "GCBallesteros/jupytext.nvim",
	--   config = function()
	--     require("jupytext").setup({
	--       style = "markdown",
	--       output_extension = "md",
	--       force_ft = "markdown",
	--     })
	--   end,
	-- },
	-- {
	--   "quarto-dev/quarto-nvim",
	--   dependencies = {
	--     "jmbuhr/otter.nvim",
	--     "benlubas/molten-nvim",
	--     "nvim-treesitter/nvim-treesitter",
	--   },
	--   config = function()
	--     require("options.quarto")
	--   end,
	-- },
	-- {
	--   'jmbuhr/otter.nvim',
	--   dependencies = {
	--     'nvim-treesitter/nvim-treesitter',
	--   },
	--   opts = {},
	-- }
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			image = {
				enabled = true,
			},
		},
	},
	{
		"ajbucci/ipynb.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons", -- optional, for language icons
			"folke/snacks.nvim", -- optional, for inline images
		},
		opts = {},
	},
	-- {
	--   dir = vim.fn.stdpath("config") .. "/lua/plugins/pdf_open",
	--   config = function()
	--     -- require("plugins.pdf_open")
	--   end,
	-- },
}
