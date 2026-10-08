return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    image = {
      enabled = true,
      doc = {
        enabled = true,
        -- 不直接貼在 buffer 裡，游標停在圖片/數學式上時才用浮動視窗顯示
        inline = false,
        float = true,
      },
      -- 用 pdflatex 把數學式排成圖片（buffer 內仍由 markview 做 Unicode render）
      math = {
        enabled = true,
        latex = {
          -- 預設模板的 `varwidth` 寬度有限，太長的式子右邊會被切掉，所以放寬到 100cm
          tpl = [[
        \documentclass[preview,border=0pt,varwidth=100cm,12pt]{standalone}
        \usepackage{${packages}}
        \begin{document}
        ${header}
        { \${font_size} \selectfont
          \color[HTML]{${color}}
        ${content}}
        \end{document}]],
        },
      },
    },
    styles = {
      -- 浮動預覽不跟著游標，改貼在視窗右側，並放在游標的另一半，避免擋住正在編輯的 LaTeX
      snacks_image = {
        relative = 'win',
        col = -1,
        row = function()
          return vim.fn.winline() <= vim.api.nvim_win_get_height(0) / 2 and -1 or 1
        end,
      },
    },
  },
}
