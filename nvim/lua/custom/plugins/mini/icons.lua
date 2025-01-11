return {
  'echasnovski/mini.icons',
  version = false,
  opts = {},
  config = function()
    local MiniIcons = require 'mini.icons'
    -- Mock Neovim web devicons globally so that Telescope calls mini.icons
    MiniIcons.mock_nvim_web_devicons()
  end,
}
