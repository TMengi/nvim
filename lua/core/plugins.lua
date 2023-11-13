-- Bootstraps the plugin manager

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'ellisonleao/gruvbox.nvim', -- Colorscheme
  'nvim-tree/nvim-tree.lua', -- File tree
  {'nvim-lualine/lualine.nvim', -- Status line
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- Icons for status line and file tree
    }
  },
  'nvim-treesitter/nvim-treesitter',
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {'williamboman/mason.nvim', -- Language servers
    dependencies = {
      'williamboman/mason-lspconfig.nvim', -- Interface to lspconfig
      'neovim/nvim-lspconfig', -- Quickstarts for lspconfig
    }
  },
  'windwp/nvim-autopairs',
  'ggandor/leap.nvim',
  'Yggdroot/indentLine',
  'numToStr/comment.nvim',
  'airblade/vim-gitgutter',
})
