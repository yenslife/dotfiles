return {
  {
    'Kurama622/llm.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim', 'Kurama622/windsurf.nvim' },
    -- 加入這個 event 就可以在 neovim 啟動完成後自動載入
    event = 'VeryLazy',
    -- cmd 表示 「當我執行這三個指令的其中一個時，才載入 llm.nvim」
    cmd = { 'LLMSessionToggle', 'LLMSelectedTextHandler', 'LLMAppHandler' },
    config = function()
      local tools = require 'llm.tools'
      require('llm').setup {
        -- enable_trace = true, -- debug 用的
        -- [[ Github Models ]]
        -- 第一種：Ollama + openai api
        -- url = 'http://localhost:11434/v1/chat/completions',
        -- model = 'qwen2.5-coder:1.5b',
        -- api_type = 'openai',
        --  第二種：ollama api (不知道為什麼只有 /api/chat 可以用)
        url = 'http://localhost:11434/api/chat',
        -- url = 'http://localhost:11434/v1/completions', 這個不能用了不要用
        model = 'qwen2.5-coder',
        api_type = 'ollama',
        -- 第三種：用外部的 API
        -- url = 'https://api.openai.com/v1/chat/completions',
        -- model = 'gpt-4.1-mini',
        -- api_type = 'openai',
        max_tokens = 8000,
        temperature = 0.3,
        top_p = 0.7,

        prompt = 'You are a helpful assistant. 說繁體中文，並且以台灣常見科技詞彙為主',

        spinner = {
          text = {
            '󰧞󰧞',
            '󰧞󰧞',
            '󰧞󰧞',
            '󰧞󰧞',
          },
          hl = 'Title',
        },

        prefix = {
          user = { text = '🦫: ', hl = 'Title' },
          assistant = { text = '🤖: ', hl = 'Added' },
        },

        -- history_path = "/tmp/llm-history",
        save_session = true,
        max_history = 15,
        max_history_name_length = 20,

        -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
          ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },

          -- 切換 focus
          ["Focus:Input"] = { mode = {"n"}, key = "<C-,"}, -- 切到 Input
          ["Focus:Output"] = { mode = {"n", "i"}, key = "<C-p>"}, -- 切到 preview
        },

        -- display diff [require by action_handler]
        display = {
          diff = {
            layout = 'vertical', -- vertical|horizontal split for default provider
            opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
            provider = 'mini_diff', -- default|mini_diff
            disable_diagnostic = true, -- Whether to show diagnostic information when displaying diff
          },
        },
        app_handler = {
          -- Your AI tools Configuration
          -- TOOL_NAME = { ... }
          WordTranslate = {
            handler = tools.flexi_handler,
            prompt = [[You are a translation expert. Your task is to translate all the text provided by the user into Chinese. NOTE: - All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.- RETURN ONLY THE TRANSLATED RESULT.]],
            opts = {
              exit_on_move = false,
              enter_flexible_window = true,
              enable_cword_context = true,
            },
          },
          AttachAsk = {
            handler = tools.attach_to_chat_handler,
            opts = {
              is_codeblock = true,
              inline_assistant = true,
              diagnostic = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
              language = 'Taiwanese',
            },
          },
          Completion = {
            handler = tools.completion_handler,
            opts = {
              -- 模型設定 (必須支援 FIM - Fill-In-Middle)
              -- 例如使用 ollama 跑 qwen2.5-coder 目前好像只支援 ollama 和 deepseek
              url = 'http://localhost:11434/v1/completions',
              model = 'qwen2.5-coder:0.5b',
              api_type = 'ollama',

              -- 補全參數
              n_completions = 1,
              context_window = 32000,
              max_tokens = 2048,

              -- 風格選擇: "virtual_text" | "blink.cmp" | "nvim-cmp"
              style = 'virtual_text',

              -- 觸發設定
              auto_trigger = true,
              throttle = 400, -- 請求頻率限制 (ms)
              debounce = 200, -- 防抖動 (ms)

              -- Virtual Text 專用按鍵設定
              keymap = {
                virtual_text = {
                  accept = { mode = 'i', keys = '<C-j>' }, -- 接受建議
                  next = { mode = 'i', keys = '<A-n>' }, -- 下一個建議
                  prev = { mode = 'i', keys = '<A-p>' }, -- 上一個建議
                  toggle = { mode = 'n', keys = '<leader>atcp' }, -- 開關補全
                },
              },
            },
          },
        },
      }
    end,
    keys = {
      { '<leader>ac', mode = 'n', '<cmd>LLMSessionToggle<cr>' },
      -- Your AI Tools Key mappings
      { '<leader>ts', mode = 'v', '<cmd>LLMAppHandler WordTranslate<cr>' },
      { '<leader>aask', mode = 'v', '<cmd>LLMAppHandler AttachAsk<cr>' },
      { '<leader>ask', mode = 'v', '<cmd>LLMSelectedTextHandler 請問這段程式碼在做什麼？<cr>' },
      -- { '<leader>ts', mode = 'v', '<cmd>LLMSelectedTextHandler<cr>' },
      --    |                 |                             |
      -- your key mapping  your mode                    tool name
    },
  },
}
