-- Basic editor configuration. Covers things like tabs/indentation,
-- searching/highlighting, window navigation, etc.

local opt = vim.opt         -- Options
local keymap = vim.keymap   -- Set keybindings

-- Tab/indent behavior
opt.expandtab = true    -- Use spaces instead of tabs
opt.shiftwidth = 2      -- Shift n spaces on tab
opt.tabstop = 2         -- 1 tab = n spaces

-- Search and highlighting
opt.smartcase = true
opt.hls = true
keymap.set('n', '<leader>hh', ':set hls!<cr>', {silent = true})

-- Split windows the way I expect them
opt.splitbelow = true
opt.splitright = true

-- Window navigation and resizing
keymap.set('n', '<c-h>', '<c-w>h', {silent = true})
keymap.set('n', '<c-j>', '<c-w>j', {silent = true})
keymap.set('n', '<c-k>', '<c-w>k', {silent = true})
keymap.set('n', '<c-l>', '<c-w>l', {silent = true})
keymap.set('n', '<up>', ':resize +1<cr>', {silent = true})
keymap.set('n', '<down>', ':resize -1<cr>', {silent = true})
keymap.set('n', '<left>', ':vertical resize -1<cr>', {silent = true})
keymap.set('n', '<right>', ':vertical resize +1<cr>', {silent = true})
keymap.set('n', '<leader>wq', ':windo wq<cr>', {silent = true})

-- Line numbering
opt.number = true

-- Line length and rulers
opt.textwidth = 79
opt.colorcolumn = '80,120'

-- Make the cmd window taller for displaying errors
opt.cmdheight = 2
