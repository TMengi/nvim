local keymap = vim.keymap

local builtin = require('telescope.builtin')

keymap.set('n', '<c-p>', builtin.find_files)
keymap.set('n', '<space><space>', builtin.oldfiles)
keymap.set('n', '<space>fg', builtin.live_grep)
keymap.set('n', '<space>fh', builtin.help_tags)
