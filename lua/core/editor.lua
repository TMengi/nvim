-- Basic editor configuration. Covers things like tabs/indentation,
-- searching/highlighting, window navigation, etc.

local api = vim.api
local keymap = vim.keymap
local opt = vim.opt
local opt_local = vim.opt_local

-- Tab/indent behavior
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Shift n spaces on tab
opt.tabstop = 2 -- 1 tab = n spaces
local four_spaces = function()
  opt_local.tabstop = 4
  opt_local.shiftwidth = 4
end
api.nvim_create_autocmd('FileType', {
  desc = 'Some languages indent with a different number of spaces',
  pattern = { 'python', 'rust', 'markdown', 'pants' },
  callback = four_spaces,
})

-- Search and highlighting
opt.smartcase = true
opt.hls = true
keymap.set('n', '<leader>hh', ':set hls!<cr>', { silent = true })

-- Split windows the way I expect them
opt.splitbelow = true
opt.splitright = true

-- Window navigation and resizing
local opts = { silent = true, noremap = true }
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
  pattern = 'rust',
  callback = function()
    opt_local.colorcolumn = '100'
  end,
})

-- Make the cmd window taller for displaying errors
opt.cmdheight = 2

-- Always show the signcolumn, otherwise it shifts the text each time
-- diagnostics appear or become resolved
opt.signcolumn = 'yes'

-- Inderline cursor line in insert mode
api.nvim_create_autocmd({ 'InsertEnter' }, {
  callback = function()
    opt.cul = true
  end,
})
api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    opt.cul = false
  end,
})

-- Update faster than the default 4000 ms
opt.updatetime = 100

-- Unconceal formatting characters
keymap.set('n', '<leader>cl', function()
  opt.conceallevel = 0
end, opts)

-- Set the filetype for some uncommon extensions
local buffer_events = { 'BufNewFile', 'BufEnter', 'BufRead' }
local filetype_like = function(pattern, desired_filetype)
  -- Sets the filetype for ``patern`` files to be ``desired_filetype``
  api.nvim_create_autocmd(buffer_events, {
    pattern = pattern,
    callback = function()
      opt_local.filetype = desired_filetype
    end,
  })
end
filetype_like('BUILD.pants', 'pants')
filetype_like('*.script', 'matlab') -- Pretend GMAT scripts are matlab

-- Explicitly set syntax for certain uncommon filetypes
local highlight_like = function(pattern, desired_syntax)
  -- Highlights `pattern` files like they are `desired_syntax` files
  api.nvim_create_autocmd(buffer_events, {
    pattern = pattern,
    callback = function()
      opt_local.syntax = desired_syntax
    end,
  })
end
highlight_like('*.sim', 'yaml')
highlight_like('*.prototxt', 'yaml')
highlight_like('BUILD.pants', 'python')

-- Explicitly set the comment string for certain uncommon filetypes
local set_commentstring = function(filetype, commentstring)
  api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      opt_local.commentstring = commentstring .. ' %s'
    end,
  })
end
set_commentstring('pants', '#')

-- Additive highlighting
keymap.set('n', '<leader>*', 'viwy/<up>\\|<c-r>0<cr>', opts)

-- Github view macro
keymap.set('n', '<leader>v', ':!gv %<cr>')

-- Don't autowrap text
opt.formatoptions:remove({ 't' })
