-- My conquest begins to reconfigure nvim in lua from scratch

-- Leader is space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tab/indent behavior
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search and highlighting
vim.opt.smartcase = true
vim.opt.hls = true
vim.keymap.set('n', '<silent><leader>hh', ':set hls!<cr>')
