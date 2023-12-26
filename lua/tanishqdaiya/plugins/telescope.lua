return {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
                { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
                local telescope = require("telescope")
                local actions = require("telescope.actions")

                telescope.setup({
                        defaults = {
                                mappings = {
                                        i = {
                                                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                                                ["<C-j>"] = actions.move_selection_next, -- move to next result
                                        }
                                }
                        }
                })

                telescope.load_extension("fzf")

                
                -- Setting keymaps
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
                vim.keymap.set('n', '<C-p>', builtin.git_files, {})
                vim.keymap.set('n', '<leader>ps', function()
                        builtin.grep_string({ search = vim.fn.input("Grep => ") })
                end)
                vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
}
