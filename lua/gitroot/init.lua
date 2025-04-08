-- lua/gitroot/init.lua
local M = {}

-- Find the git root from a given path
local function find_git_root(path)
  local uv = vim.loop
  path = uv.fs_realpath(path)

  while path do
    local git_path = path .. "/.git"
    local stat = uv.fs_stat(git_path)
    if stat and stat.type == "directory" then
      return path
    end
    -- Move up a dir
    local parent = path:match("(.+)/[^/]+$")
    if parent == path then break end
    path = parent
  end
end

-- Auto cd into git root if found
function M.auto_cd_git_root()
  local filepath = vim.fn.expand("%:p")
  local git_root = find_git_root(filepath)
  if git_root then
    vim.cmd("cd " .. vim.fn.fnameescape(git_root))
  end
end

-- Set up autocommand to trigger on file read
function M.setup()
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = M.auto_cd_git_root,
    group = vim.api.nvim_create_augroup("GitAutoCd", { clear = true }),
  })
end

return M
