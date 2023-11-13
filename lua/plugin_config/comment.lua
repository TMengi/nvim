local keymap = vim.keymap

require('Comment').setup()

keymap.set('n', '<c-_>', '<plug>(comment_toggle_linewise_current)')
keymap.set('x', '<c-_>', '<plug>(comment_toggle_linewise_visual)')
