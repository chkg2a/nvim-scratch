require("telescope").setup({
  extensions = {
    repo = {
      list = {
        fd_opts = {
          "--no-ignore-vcs",
        },
        search_dirs = {
          "~/projects",
          "~/.local/share/clone",
          "~/.config/",
        },
      },
    },
  },
})
require("telescope").load_extension "repo"
