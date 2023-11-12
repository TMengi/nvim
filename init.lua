-- My conquest begins to reconfigure nvim in lua from scratch

-- TODO
-- [ ] configure tabwidth by file extension
--   - lua should be 2
-- [ ] language server with mason
-- [ ] leap.nvim
-- [ ] gitgutter or gitlens
-- [ ] commenter
-- [ ] indentline

local g = vim.g     -- Global variables

-- Leader is space
g.mapleader = ' '
g.maplocalleader = ' '

require('core.editor')
require('core.plugins')
require('plugin_config')
