local autopairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')
local Rule = require('nvim-autopairs.rule')

autopairs.setup({
  enable_check_bracket_line = false,
})

autopairs.add_rules({
  Rule('<', '>', 'rust')
    -- Don't add pair after a space, which allows for typing normal comparison
    -- operators
    :with_pair(
      cond.not_before_regex(' ')
    ),
})
