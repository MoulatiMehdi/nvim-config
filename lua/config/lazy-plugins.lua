-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    'nvim-tree/nvim-web-devicons',
    {
        'folke/trouble.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }, -- Ensure you have the icons dependency
        opts = { -- Configuration options for trouble.nvim
            use_diagnostic_signs = true, -- enable diagnostics icons
            indent_lines = true, -- add indent guide below the fold icons
        }, -- for default options, refer to the configuration section for custom setup.
        cmd = 'Trouble',
        keys = {
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>cs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            {
                '<leader>cl',
                '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                desc = 'LSP Definitions / references / ... (Trouble)',
            },
            {
                '<leader>xL',
                '<cmd>Trouble loclist toggle<cr>',
                desc = 'Location List (Trouble)',
            },
            {
                '<leader>xQ',
                '<cmd>Trouble qflist toggle<cr>',
                desc = 'Quickfix List (Trouble)',
            },
        },
    },
    {
        'MoulatiMehdi/nvim-norminette',
        config = function()
            local norm = require 'norminette'
            norm.setup {
                format_on_save = true,
            }
            vim.keymap.set(
                'n',
                '<F5>',
                ':Norminette<CR>',
                { noremap = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<C-f>',
                ':Format<CR>',
                { noremap = true, silent = true }
            )
        end,
    },
    {
        'MoulatiMehdi/42header.nvim',
        config = function()
            require '42header'
        end,
    },
    {
        'ThePrimeagen/harpoon', -- Harpoon (file navigator)
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local harpoon = require 'harpoon'
            harpoon:setup()
            -- keymaps for harpoon
            vim.keymap.set('n', '<leader>a', function()
                harpoon:list():add()
            end)
            vim.keymap.set('n', '<C-e>', function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
            vim.keymap.set('n', '<C-h>', function()
                harpoon:list():select(1)
            end)
            vim.keymap.set('n', '<C-t>', function()
                harpoon:list():select(2)
            end)
            vim.keymap.set('n', '<C-n>', function()
                harpoon:list():select(3)
            end)
            vim.keymap.set('n', '<C-s>', function()
                harpoon:list():select(4)
            end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set('n', '<C-P>', function()
                harpoon:list():prev()
            end)
            vim.keymap.set('n', '<C-N>', function()
                harpoon:list():next()
            end)
        end,
    },

    -- NOTE: Plugins can also be added by using a table,
    -- with the first argument being the link and the following
    -- keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to force a plugin to be loaded.
    --

    -- modular approach: using `require 'path/name'` will
    -- include a plugin definition from file lua/path/name.lua

    require 'kickstart/plugins/gitsigns',

    require 'kickstart/plugins/which-key',

    require 'kickstart/plugins/telescope',

    require 'kickstart/plugins/lspconfig',

    require 'kickstart/plugins/conform',

    require 'kickstart/plugins/cmp',

    require 'kickstart/plugins/tokyonight',

    require 'kickstart/plugins/todo-comments',

    require 'kickstart/plugins/mini',

    require 'kickstart/plugins/treesitter',

    -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    -- require 'kickstart.plugins.debug',
    require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    require 'kickstart.plugins.autopairs',
    -- require 'kickstart.plugins.neo-tree',

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    This is the easiest way to modularize your config.
    --
    --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
    --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
    -- { import = 'custom.plugins' },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})

-- vim: ts=2 sts=2 sw=2 et
