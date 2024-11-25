return {
	{
		"williamboman/mason.nvim",

		opts = {
			auto_install = true,
			ensure_installed = {
				"lua-language-server",
				"bash-language-server",
				"stylua",
				"clangd",
			},
			ui = {

				check_outdated_packages_on_open = true,
				border = "rounded",
				height = 0.7,
			},
		},
	},
}
