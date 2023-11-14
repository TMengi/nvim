local keymap = vim.keymap

local builtin = require('telescope.builtin')

local opts = { noremap = true }
keymap.set('n', '<c-p>', builtin.find_files, opts)
keymap.set('n', '<space><space>', builtin.oldfiles, opts)
keymap.set('n', '<space>fg', builtin.live_grep, opts)
keymap.set('n', '<space>fh', builtin.help_tags, opts)
