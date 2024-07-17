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
          enable = false,
          chars = { '│', '¦', '┆', '┊' },
          style = {
            { fg = '#E6DB74', bg = 'NONE' },
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
}
