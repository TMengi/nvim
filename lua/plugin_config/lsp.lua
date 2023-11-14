local keymap = vim.keymap
local lsp = vim.lsp

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'pyright',
    'rust_analyzer',
  },
})

local on_attach = function(_, _)
  keymap.set('n', '<leader>rn', lsp.buf.rename)
  keymap.set('n', '<leader>ca', lsp.buf.code_action)
  keymap.set('n', 'K', lsp.buf.hover)
  keymap.set('n', 'gd', lsp.buf.definition)
  keymap.set('n', 'gi', lsp.buf.implementation)
  keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
end

-- Include completion capabilities in various LSPs
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
-- TODO: Figure out how to pass on_attach and capabilities as an extendable
-- table to all configs
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim', -- Tells the LSP that the vim API is in the global namespace
        },
      },
    },
  },
})
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({})
