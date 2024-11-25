return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		keys = {
			{
				"<C-f>",
				function()
					require("conform").format { async = true, lsp_fallback = true }
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		options = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clangd" },
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
