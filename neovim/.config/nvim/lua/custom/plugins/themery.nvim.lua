return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    -- 在這邊新增主題
    local keywords = { 'cyberdream', 'fox', 'tokyonight', 'catppuccin' } -- 不知道為什麼 gruvbox 有時候會壞掉
    local all_themes = vim.fn.getcompletion('', 'color')

    local selected_theme = vim.tbl_filter(function(name)
      for _, keyword in ipairs(keywords) do
        if name:lower():match(keyword) then
          return true
        end
      end
      return false
    end, all_themes)

    require('themery').setup {
      -- add the config here
      -- themes = selected_theme,
      themes = all_themes,
    }
    -- show Thmery menu using <leader>T
    vim.keymap.set('n', '<leader>T', function()
      local themery = require 'themery'
      themery.themery()
      -- Themery 原本的 Enter 只儲存預覽位置，沒有套用游標所在的主題。
      vim.keymap.set('n', '<CR>', function()
        local index = vim.api.nvim_win_get_cursor(0)[1] - 1
        if index < 1 or index > #themery.getAvailableThemes() then
          return
        end
        themery.setThemeByIndex(index, false)
        themery.closeAndSave()
      end, { buffer = true, silent = true, desc = '套用並儲存主題' })
    end, { desc = 'Show Themery Menu' })
  end,
}
