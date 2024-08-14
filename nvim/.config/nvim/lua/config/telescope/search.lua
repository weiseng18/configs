local builtin = require("telescope.builtin")

local M = {}

-- find files, including hidden ones
M.find_files = function()
  builtin.find_files({
    hidden = true,  -- Include hidden files
  })
end

-- live grep, including hidden files (assumption: underlying is ripgrep)
M.live_grep = function()
  builtin.live_grep({
    additional_args = function(opts)
      return { "--hidden" }
    end,
  })
end

return M
