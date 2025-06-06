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
    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        if not vim.api.nvim_win_is_valid(cur_target) then
          print 'Current target window is invalid'
          return
        end

        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. ' split')

          ---@diagnostic disable-next-line: redundant-return-value
          return vim.api.nvim_get_current_win()
        end)

        if not vim.api.nvim_win_is_valid(new_target) then
          print 'New target window is invalid'
          return
        end

        MiniFiles.set_target_window(new_target)
        MiniFiles.go_in { close_on_file = true }
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, '<C-s>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
      end,
    })

    -- Add a functions and keymaps for toggling the file tree
    local minifiles_toggle_root = function()
      if not MiniFiles.close() then
        MiniFiles.open()
      end
    end

    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end
    end
    vim.keymap.set('n', '<Leader>f', minifiles_toggle_root, { desc = 'Browse [F]iles' })
    vim.keymap.set('n', '-', minifiles_toggle, { desc = 'Show current file in file tree' })
  end,
}
