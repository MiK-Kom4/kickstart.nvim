return {
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = '#A6E22E', bg = '#1B1D1E' },
          },
        },
        indent = {
          enable = true,
          chars = { '│', '¦', '┆', '┊' },
          style = {
            { fg = '#B0B0B0', bg = 'NONE' },
          },
        },
        line_num = {
          enable = true,
          style = {
            { fg = '#F92672', bg = 'NONE' },
          },
        },
        blank = {
          enable = true,
          style = {
            { fg = '#75715E', bg = 'NONE' },
          },
        },
      }
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*', -- デフォルトですべてのファイルタイプで有効にします
      }, {
        RGB = true, -- #RGB形式のカラーコードを有効
        RRGGBB = true, -- #RRGGBB形式のカラーコードを有効
        names = false, -- "Name"カラーサポートを無効
        RRGGBBAA = true, -- #RRGGBBAA形式のカラーコードを有効
        rgb_fn = true, -- CSSのrgb()とrgba()関数を有効
        hsl_fn = true, -- CSSのhsl()とhsla()関数を有効
        css = true, -- CSSのカラーを有効
        css_fn = true, -- CSSの関数カラーを有効
      })
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    opts = {
      -- オプションをここに追加します。何も指定しない場合、デフォルトが使用されます。
      -- animation = true,
      -- insert_at_start = true,
      -- など
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      -- Magic buffer-picking mode
      map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
      -- Sort automatically by...
      map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
      map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
      map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
      map('n', '<A-n>', '<Cmd>enew<CR>', opts)
    end,
  },
}
