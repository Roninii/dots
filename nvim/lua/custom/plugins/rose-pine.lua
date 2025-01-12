return {
  {
    enabled = true,
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    opts = {
      variant = 'main',
      dark_variant = 'main',
      dim_inactive_windows = true,
      extend_background_behind_borders = true,
      enable = {
        terminal = true,
      },
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
      highlight_groups = {
        Comment = { italic = true },
        Keyword = { italic = true },
      },
    },
    init = function()
      vim.cmd [[colorscheme rose-pine]]
    end,
  },
}
