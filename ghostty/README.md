# Ghostty 主題設定

在 `.config/ghostty/config` 修改 `theme` 一行，儲存後按 `Cmd + Shift + ,` 重新載入。

白天使用內建主題：

```ini
theme = TokyoNight Day
```

晚上使用原本的自訂配色：

```ini
theme = TokyoNight Custom
```

自訂夜間配色放在 `.config/ghostty/themes/TokyoNight Custom`，可直接修改其中的背景、文字、游標、選取區與 palette。主設定中的同名色彩選項會覆蓋主題，因此配色統一放在主題檔。

參考：https://ghostty.org/docs/features/theme

## macOS 白天風格

```ini
theme = macOS Day
```

自訂主題位於 `.config/ghostty/themes/macOS Day`：配色沿用 Ghostty 內建的 Terminal Basic，對應 macOS Terminal 的 Basic 風格：純白底、黑字、灰色游標與鮮豔 ANSI 色。這是自訂配色，並非 Apple 官方主題。

Neovim 的語法配色仍由 colorscheme 決定；建議搭配淺色主題。若 Neovim 使用透明背景，會顯示這個主題的暖白底色。
