return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			build = ":TSUpdate",
			auto_install = true,
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"query",
				"diff",
				"vim",
				"lua",
				"luadoc",
				"vimdoc",
				"c",
				"bash",
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
