-- My conquest begins to reconfigure nvim in lua from scratch

-- TODO
-- [ ] gitgutter or gitlens
-- [ ] commenter

local g = vim.g

-- Leader is space
g.mapleader = ' '
g.maplocalleader = ' '

require('core.editor')
require('core.plugins')
require('plugin_config')
