-- My conquest begins to reconfigure nvim in lua from scratch

local g = vim.g         -- Global varaibles
local opt = vim.opt     -- Set options

-- Leader is space
g.mapleader = ' '
g.maplocalleader = ' '

-- Tab/indent behavior
opt.expandtab = true    -- Use spaces instead of tabs
opt.shiftwidth = 4      -- Shift 4 spaces on tab
opt.tabstop = 4         -- 1 tab = 4 spaces

-- Search and highlighting
opt.smartcase = true
opt.hls = true
vim.keymap.set('n', '<leader>hh', ':set hls!<cr>', {silent = true})
