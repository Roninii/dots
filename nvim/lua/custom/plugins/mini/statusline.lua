return {
  'echasnovski/mini.statusline',
  version = false,
  opts = {},
  config = function()
    -- Modify statusline to show line and column number with : instead of |
    local statusline = require 'mini.statusline'
    statusline.setup {}
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
