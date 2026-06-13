return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  submodules = false,

  -- Completion for `blink.cmp`
  dependencies = { 'saghen/blink.cmp' },

  opts = {
    preview = {
      enable = false,
    },
    latex = {
      enable = true,
    },
  },

  keys = {
    -- 開/關 Markview render
    { '<leader>mv', '<cmd>Markview<cr>', desc = '[M]arkview toggle [V]iew' },

    -- 開/關 hybrid mode：游標附近顯示原始 Markdown，其他地方 render
    { '<leader>mh', '<cmd>Markview HybridToggle<cr>', desc = '[M]arkview toggle [H]ybrid' },

    -- 左右 split，一邊原文一邊預覽
    { '<leader>ms', '<cmd>Markview splitToggle<cr>', desc = '[M]arkview [S]plit preview' },
  },
}
