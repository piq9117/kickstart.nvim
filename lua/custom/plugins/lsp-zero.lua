local lua_ls_config = {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      runtime = { version = 'LuaJIT' },
      telemetry = { enable = true },
    },
  },
}

return {
  'VonHeikemen/lsp-zero.nvim',
  config = function()
    local lsp = require 'lsp-zero'
    lsp.set_preferences { call_servers = 'global' }
    lsp.configure('lua_ls', lua_ls_config)
    lsp.setup_servers { 'lua_ls' }
    lsp.setup()
  end,
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
}
