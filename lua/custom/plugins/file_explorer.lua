return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        -- 表示オプション
        filesystem = {
          filtered_items = {
            hide_dotfiles = false, -- ドットファイルを表示
            hide_gitignored = false, -- .gitignore で無視されたファイルを表示
          },
          follow_current_file = {
            enabled = true, -- 現在のファイルを自動的に表示
          },
          use_libuv_file_watcher = true, -- ファイルシステムの変更を監視
        },
        -- バッファやウィンドウの動作
        buffers = {
          follow_current_file = {
            enabled = true, -- 現在のファイルを自動的に表示
          },
        },
        -- アイコンの設定
        source_selector = {
          winbar = true, -- ウィンバーにソースセレクタを表示
          statusline = false, -- ステータスラインにソースセレクタを表示
        },
        -- キーバインディング
        default_component_configs = {
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '',
            default = '*',
          },
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
          },
        },
        window = {
          position = 'left',
          width = 40,
        },
        -- イベントの設定
        event_handlers = {
          {
            event = 'file_opened',
            handler = function()
              -- ファイルが開かれたときにNeo-treeを閉じる
              require('neo-tree').close_all()
            end,
          },
        },
      }
    end,
  },
}
