return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'monaqa/dial.nvim',
    config = function()
      local dial = require 'dial.map'

      -- キーマッピングの設定
      vim.keymap.set('n', '<C-a>', dial.inc_normal())
      vim.keymap.set('n', '<C-x>', dial.dec_normal())
      vim.keymap.set('n', 'g<C-a>', dial.inc_gnormal())
      vim.keymap.set('n', 'g<C-x>', dial.dec_gnormal())
      vim.keymap.set('v', '<C-a>', dial.inc_visual())
      vim.keymap.set('v', '<C-x>', dial.dec_visual())
      vim.keymap.set('v', 'g<C-a>', dial.inc_gvisual())
      vim.keymap.set('v', 'g<C-x>', dial.dec_gvisual())

      -- Augendの設定
      local augend = require 'dial.augend'
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal, -- 非負の10進数
          augend.integer.alias.hex, -- 非負の16進数
          augend.date.alias['%Y/%m/%d'], -- 日付 (YYYY/MM/DD)
          augend.constant.alias.bool, -- ブール値 (true <-> false)
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.constant.alias.bool, -- ビジュアルモード用のブール値
        },
      }

      -- Visualモード用のキーマッピング
      vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual 'visual', { noremap = true })
      vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual 'visual', { noremap = true })
    end,
  },
}
