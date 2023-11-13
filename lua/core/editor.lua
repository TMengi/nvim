-- Basic editor configuration. Covers things like tabs/indentation,
-- searching/highlighting, window navigation, etc.

local api = vim.api
local keymap = vim.keymap
local opt = vim.opt
local opt_local = vim.opt_local

-- Tab/indent behavior
opt.expandtab = true  -- Use spaces instead of tabs
opt.shiftwidth = 4    -- Shift n spaces on tab
opt.tabstop = 4       -- 1 tab = n spaces
api.nvim_create_autocmd('FileType', {
  desc = 'Some languages indent with 2 spaces',
  pattern = {'lua', 'cpp', 'h'},
  callback = function()
    opt_local.tabstop = 2
    opt_local.shiftwidth = 2
  end
})

-- Search and highlighting
opt.smartcase = true
opt.hls = true
keymap.set('n', '<leader>hh', ':set hls!<cr>', {silent = true})

-- Split windows the way I expect them
opt.splitbelow = true
opt.splitright = true

-- Window navigation and resizing
local opts = {silent = true, noremap = true}
keymap.set('n', '<c-h>', '<c-w>h', opts)
keymap.set('n', '<c-j>', '<c-w>j', opts)
keymap.set('n', '<c-k>', '<c-w>k', opts)
keymap.set('n', '<c-l>', '<c-w>l', opts)
keymap.set('n', '<up>', ':resize +1<cr>', opts)
keymap.set('n', '<down>', ':resize -1<cr>', opts)
keymap.set('n', '<left>', ':vertical resize -1<cr>', opts)
keymap.set('n', '<right>', ':vertical resize +1<cr>', opts)
keymap.set('n', '<leader>wq', ':windo q<cr>', opts)
keymap.set('n', '<leader>=', '<c-w>=', opts)

-- Line numbering
opt.number = true

-- Line length and rulers
opt.textwidth = 79
opt.colorcolumn = '80,120'
api.nvim_create_autocmd('FileType', {
  desc = 'Rust allows longer line lengths',
  pattern = '*.rs',
  callback = function()
    opt_local.colorcolumn = '100'
  end
})

-- Make the cmd window taller for displaying errors
opt.cmdheight = 2

-- Always show the signcolumn, otherwise it shifts the text each time
-- diagnostics appear or become resolved
opt.signcolumn = 'yes'

-- Inderline cursor line in insert mode
api.nvim_create_autocmd({'InsertEnter'}, {
  callback = function() opt.cul = true end
})
api.nvim_create_autocmd({'InsertLeave'}, {
  callback = function() opt.cul = false end
})

-- Update faster than the default 4000 ms
opt.updatetime = 100
