local lsp = require('lspconfig')
local M = {}

local base = function(opts)
  opts = opts or {}
  opts.on_attach = function(_, bufnr)
    local x = { buffer = bufnr, noremap = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, x)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, x)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, x)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, x)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, x)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, x)
  end
  opts.capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
  return opts
end

M.base = base

M.java  = function()
  lsp.jdtls.setup{ cmd = { 'jdtls' } }
end

M.python = function()
  lsp.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    }
  }
end

M.lua = function()
  lsp.lua_ls.setup {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
            -- Depending on the usage, you might want to add additional paths here.
            -- "${3rd}/luv/library"
            -- "${3rd}/busted/library",
          }
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        }
      })
    end,
    settings = {
      Lua = {}
    }
  }
end

return M
