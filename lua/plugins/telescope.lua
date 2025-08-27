return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.vim'},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, {})
	end
}
				
