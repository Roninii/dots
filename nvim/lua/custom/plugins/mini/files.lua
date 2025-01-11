return {
  'echasnovski/mini.files',
  version = false,
  opts = {
    windows = {
      preview = true,
      width_preview = 100,
    },
  },
  init = function()
    -- Add a function and keymap for toggling the file tree
    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open()
      end
    end
    vim.keymap.set('n', '<leader>ft', minifiles_toggle, { desc = '[F]ile [T]ree' })
  end,
}
