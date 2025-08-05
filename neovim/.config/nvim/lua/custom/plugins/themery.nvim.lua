return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    -- 在這邊新增主題
    local keywords = { 'tokyonight', 'gruvbox', 'catppuccin', 'fox' }
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
      themes = selected_theme,
      -- themes = all_themes,
    }
    -- show Thmery menu using <leader>T
    vim.keymap.set('n', '<leader>T', ':Themery <CR>', { noremap = true, desc = 'Show Themery Menu' })
  end,
}
