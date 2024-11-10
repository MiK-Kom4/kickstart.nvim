return {
  -- gitsigns.nvimの設定
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        signs_staged = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk)
          map('n', '<leader>hr', gitsigns.reset_hunk)
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end)
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end)
          map('n', '<leader>hS', gitsigns.stage_buffer)
          map('n', '<leader>hu', gitsigns.undo_stage_hunk)
          map('n', '<leader>hR', gitsigns.reset_buffer)
          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hb', function()
            gitsigns.blame_line { full = true }
          end)
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>hd', gitsigns.diffthis)
          map('n', '<leader>hD', function()
            gitsigns.diffthis '~'
          end)
          map('n', '<leader>td', gitsigns.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      }
    end,
  },

  -- diffview.nvimの設定
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        diff_binaries = false, -- Show diffs for binaries
        use_icons = true, -- Requires nvim-web-devicons
        enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
        signs = {
          fold_closed = '',
          fold_open = '',
          done = '✓',
        },
        file_panel = {
          win_config = {
            position = 'left', -- One of 'left', 'right', 'top', 'bottom'
            width = 35, -- Only applies when position is 'left' or 'right'
            height = 10, -- Only applies when position is 'top' or 'bottom'
          },
        },
        key_bindings = {
          disable_defaults = false, -- Disable the default key bindings
          view = {
            ['<tab>'] = require('diffview.actions').select_next_entry, -- Open the diff for the next file
            ['<s-tab>'] = require('diffview.actions').select_prev_entry, -- Open the diff for the previous file
            ['gf'] = require('diffview.actions').goto_file, -- Open the file in a new split in the previous tabpage
            ['<C-w><C-f>'] = require('diffview.actions').goto_file_split, -- Open the file in a new split
            ['<C-w>gf'] = require('diffview.actions').goto_file_tab, -- Open the file in a new tabpage
            ['<leader>e'] = require('diffview.actions').focus_files, -- Bring focus to the files panel
            ['<leader>b'] = require('diffview.actions').toggle_files, -- Toggle the files panel.
          },
          file_panel = {
            ['j'] = require('diffview.actions').next_entry, -- Bring the cursor to the next file entry
            ['<down>'] = require('diffview.actions').next_entry,
            ['k'] = require('diffview.actions').prev_entry, -- Bring the cursor to the previous file entry.
            ['<up>'] = require('diffview.actions').prev_entry,
            ['<cr>'] = require('diffview.actions').select_entry, -- Open the diff for the selected entry.
            ['o'] = require('diffview.actions').select_entry,
            ['R'] = require('diffview.actions').refresh_files, -- Update stats and entries in the file list.
            ['<tab>'] = require('diffview.actions').select_next_entry,
            ['<s-tab>'] = require('diffview.actions').select_prev_entry,
            ['gf'] = require('diffview.actions').goto_file,
            ['<C-w><C-f>'] = require('diffview.actions').goto_file_split,
            ['<C-w>gf'] = require('diffview.actions').goto_file_tab,
            ['i'] = require('diffview.actions').listing_style, -- Toggle between 'list' and 'tree' views
            ['f'] = require('diffview.actions').toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
            ['<leader>e'] = require('diffview.actions').focus_files,
            ['<leader>b'] = require('diffview.actions').toggle_files,
          },
          file_history_panel = {
            ['g!'] = require('diffview.actions').options, -- Open the option panel
            ['<C-A-d>'] = require('diffview.actions').open_in_diffview, -- Open the entry under the cursor in a diffview
            ['y'] = require('diffview.actions').copy_hash, -- Copy the commit hash of the entry under the cursor
            ['zR'] = require('diffview.actions').open_all_folds,
            ['zM'] = require('diffview.actions').close_all_folds,
            ['j'] = require('diffview.actions').next_entry,
            ['<down>'] = require('diffview.actions').next_entry,
            ['k'] = require('diffview.actions').prev_entry,
            ['<up>'] = require('diffview.actions').prev_entry,
            ['<cr>'] = require('diffview.actions').select_entry,
            ['o'] = require('diffview.actions').select_entry,
            ['<tab>'] = require('diffview.actions').select_next_entry,
            ['<s-tab>'] = require('diffview.actions').select_prev_entry,
            ['gf'] = require('diffview.actions').goto_file,
            ['<C-w><C-f>'] = require('diffview.actions').goto_file_split,
            ['<C-w>gf'] = require('diffview.actions').goto_file_tab,
            ['<leader>e'] = require('diffview.actions').focus_files,
            ['<leader>b'] = require('diffview.actions').toggle_files,
          },
          option_panel = {
            ['<tab>'] = require('diffview.actions').select_entry,
            ['q'] = require('diffview.actions').close,
          },
        },
      }
    end,
  },
}
