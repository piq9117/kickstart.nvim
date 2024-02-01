local orgmode_config = function()
	require('orgmode').setup_ts_grammar()


	require('nvim-treesitter.configs').setup({
		highlight = {
			enable = true,
			additional_vim_regex_highlighting =  {'org'},
		},
		ensure_installed = {'org'}
	})

	require('orgmode').setup({
		mappings = {
			org = {
				org_toggle_checkbox = '<leader><space>',
			},
		},
		org_agenda_files = '~/code/notes**/*'
	})
end

return {
	'nvim-orgmode/orgmode',
	dependencies = {
		{'nvim-treesitter/nvim-treesitter', lazy = true}
	},
	event = 'VeryLazy',
	config = orgmode_config

}
