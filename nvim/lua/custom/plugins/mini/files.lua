return {
  'echasnovski/mini.files',
  version = false,
  opts = {
    windows = {
      preview = true,
      width_preview = 100,
    },
    options = {
      permanent_delete = false,
    },
  },
  init = function()
    -- Add a function and keymap for toggling the file tree
    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end
    end
    vim.keymap.set('n', '-', minifiles_toggle, { desc = 'Reveal current file in Mini.Files' })
  end,
}
