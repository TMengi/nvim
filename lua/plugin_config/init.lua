-- Allows us to wholesale require('plugin_config') in the main init.lua

-- Put new files in here, .lua config paths relative to config_dir
local config_dir = 'plugin_config'
plugin_names = {
  'gruvbox',
  'lualine',
  'nvim-tree',
  'nvim-treesitter',
  'telescope',
}

for _, name in pairs(plugin_names) do
  require(config_dir .. '.' .. name)
end
