require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox', -- Should I be using 'auto'?
  },
  sections = {
    lualine_b = {
      'diff',
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
    },
  },
})
