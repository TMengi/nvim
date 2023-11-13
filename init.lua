-- My conquest begins to reconfigure nvim in lua from scratch

-- TODO
-- [ ] Code formatting
--   - [x] lua
--   - [ ] python
--   - [ ] C++
-- [ ] Jump to LSP diagnostics
-- [ ] LSP for C++

local g = vim.g

-- Leader is space
g.mapleader = ' '
g.maplocalleader = ' '

require('core.editor')
require('core.plugins')
require('plugin_config')
