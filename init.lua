-- My conquest begins to reconfigure nvim in lua from scratch

-- TODO
-- [ ] Warn about trailing whitespace

local g = vim.g

-- Leader is space
g.mapleader = ' '
g.maplocalleader = ' '

require('core.editor')
require('core.plugins')
require('plugin_config')
