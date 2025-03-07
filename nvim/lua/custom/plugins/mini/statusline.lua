return {
  'echasnovski/mini.statusline',
  version = false,
  opts = {},
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup {}

    -- CodeCompanion integration
    local cc_processing = false
    local spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    local spinner_index = 1
    local spinner_timer = nil

    -- Create augroup for CodeCompanion hooks
    local group = vim.api.nvim_create_augroup('CodeCompanionHooks', {})

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'CodeCompanionRequest*',
      group = group,
      callback = function(request)
        if request.match == 'CodeCompanionRequestStarted' then
          cc_processing = true
          -- Start spinner animation
          if not spinner_timer then
            spinner_timer = vim.loop.new_timer()
            spinner_timer:start(
              0,
              100,
              vim.schedule_wrap(function()
                spinner_index = (spinner_index % #spinner_symbols) + 1
                vim.cmd 'redrawstatus'
              end)
            )
          end
        elseif request.match == 'CodeCompanionRequestFinished' then
          cc_processing = false
          -- Stop spinner animation
          if spinner_timer then
            spinner_timer:stop()
            spinner_timer:close()
            spinner_timer = nil
          end
          vim.cmd 'redrawstatus'
        end
      end,
    })

    -- Add CodeCompanion section
    statusline.section_codecompanion = function()
      if cc_processing then
        return spinner_symbols[spinner_index] .. ' CodeCompanion'
      else
        return ''
      end
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- Override the default active statusline content to include CodeCompanion
    statusline.config.content.active = function()
      local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
      local git = statusline.section_git { trunc_width = 40 }
      local diff = statusline.section_diff { trunc_width = 75 }
      local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
      local lsp = statusline.section_lsp { trunc_width = 75 }
      local filename = statusline.section_filename { trunc_width = 140 }
      local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
      local location = statusline.section_location { trunc_width = 75 }
      local search = statusline.section_searchcount { trunc_width = 75 }
      local codecompanion = statusline.section_codecompanion()

      return statusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineDevinfo', strings = { codecompanion } },
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      }
    end
  end,
}
