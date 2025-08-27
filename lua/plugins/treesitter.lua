return {
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	event = { "BufReadPre", "BufNewFile"}, 
	build = ":TSUpdate",
	config = function()
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
	end
}
