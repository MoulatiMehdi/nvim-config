return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
	config = function()
		require("nvim-autopairs").setup {}
		-- If you want to automatically add `(` after selecting a function or method
		local cmp_autopairs = require "nvim-autopairs.completion.cmp"
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
