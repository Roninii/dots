return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    opts = {
      variant = 'main',
      dark_variant = 'main',
      dim_inactive_windows = true,
      extend_background_behind_borders = true,
    },
    config = function()
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
