vim.opt.relativenumber = true		-- Show relatvice line numbers
vim.opt.number = true
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>", { silent = true} )
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4		-- Number of spaces per indentation level

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.vim'},
	{
		"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, event = { "BufReadPre", "BufNewFile"}, build = ":TSUpdate"
	}
}
}
local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, {})

require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"lua",
		--web
		"javascript",
		"typescript",
		"html",
		"css",
		"json",
		"jsonc",

		"markdown",
		"markdown_inline",
		"dockerfile",
		"yaml",
		"gitcommit",
		"git_config",
		"gitignore",
		"graphql",
		"go",

		"regex",
		"sql",
		"comment",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
}

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
