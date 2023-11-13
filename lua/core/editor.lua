-- Basic editor configuration. Covers things like tabs/indentation,
-- searching/highlighting, window navigation, etc.

local api = vim.api
local keymap = vim.keymap
local opt = vim.opt

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

-- Always show the signcolumn, otherwise it shifts the text each time
-- diagnostics appear or become resolved
opt.signcolumn = 'yes'

-- Inderline cursor line in insert mode
api.nvim_create_autocmd({'InsertEnter'}, {
  command = 'set cul'
})
api.nvim_create_autocmd({'InsertLeave'}, {
  callback = function() opt.cul = false end
})
