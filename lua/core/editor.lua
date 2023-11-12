-- Basic editor configuration. Covers things like tabs/indentation,
-- searching/highlighting, window navigation, etc.

local opt = vim.opt         -- Options
local keymap = vim.keymap   -- Set keybindings

-- Tab/indent behavior
opt.expandtab = true    -- Use spaces instead of tabs
opt.shiftwidth = 4      -- Shift 4 spaces on tab
opt.tabstop = 4         -- 1 tab = 4 spaces

-- Search and highlighting
opt.smartcase = true
opt.hls = true
keymap.set('n', '<leader>hh', ':set hls!<cr>', {silent = true})

-- Split windows the way I expect them
opt.splitbelow = true
opt.splitright = true

-- Window navigation
keymap.set('n', '<c-h>', '<c-w>h', {silent = true})
keymap.set('n', '<c-j>', '<c-w>j', {silent = true})
keymap.set('n', '<c-k>', '<c-w>k', {silent = true})
keymap.set('n', '<c-l>', '<c-w>l', {silent = true})
keymap.set('n', '<leader>wq', ':windo wq<cr>', {silent = true})

-- Line numbering
opt.number = true

-- Line length and rulers
opt.textwidth = 79
opt.colorcolumn = '80,120'

-- TODO
-- [ ] configure tabwidth by file extension
--   - lua should be 2
