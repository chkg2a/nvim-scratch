-- lua/options/nvim-treesitter.lua
return function()
  require("nvim-treesitter.config").setup {
    ensure_installed = {
      "bash","c","diff","html","javascript","jsdoc","json","jsonc",
      "lua","luadoc","luap","markdown","markdown_inline","printf",
      "python","query","regex","toml","tsx","typescript","vim",
      "vimdoc","xml","yaml",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }
end
