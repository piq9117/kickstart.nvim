return {
	'VonHeikemen/lsp-zero.nvim',
	config = function()
		local lsp = require('lsp-zero')
		lsp.set_preferences({ call_servers = 'global', })
		lsp.setup_servers({'lua_ls',})
		lsp.setup()
	end,
	dependencies = {
		{'neovim/nvim-lspconfig'},
	},
}
