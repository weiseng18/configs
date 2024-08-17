local builtin = require("telescope.builtin")

local M = { file = {}, word = {} }

-- find files, including hidden ones
M.file.files = function()
  builtin.find_files({
    cwd = ".",
    hidden = true,  -- Include hidden files
  })
end

--- Is cwd in git repo
local is_git_repo = function()
  local cmd = "git rev-parse --is-inside-work-tree"
  local git_check = vim.fn.systemlist(cmd)[1]
  return git_check == "true"
end

-- Find file in repo
M.file.repo = function()
  if not is_git_repo() then
    return
  end
  builtin.git_files({
    cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    prompt_title = "Search in repo",
  })
end

-- live grep, including hidden files (assumption: underlying is ripgrep)
M.word.files = function()
  builtin.live_grep({
    additional_args = function(opts)
      return { "--hidden" }
    end,
  })
end

-- live grep in repo
M.word.repo = function()
  if not is_git_repo() then
    return
  end
  builtin.live_grep({
    cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    prompt_title = "Search in repo",
    additional_args = function(opts)
      return { "--hidden" }
    end,
  })
end

return M
