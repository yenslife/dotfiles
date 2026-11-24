# tmux 設定

## 一行切換 Powerline 日夜配色

在 `.tmux.conf` 修改 `@appearance`，再按 `Ctrl+a`、`r` 重新載入：

```tmux
set -g @appearance 'day'
```

- `day`：自訂 Powerline Day，暖白底、淺藍與灰色分段，搭配 macOS Day。
- `night`：原本的 Powerline Cyan。

兩者保留相同資訊：session、使用者、視窗與窗格編號、視窗列表、時間、日期與主機名稱。白天版沿用 tmux-themepack 的資訊格式選項，只覆寫配色與箭頭分段的顏色；不修改外掛檔案。

TPM 載入後先套用原版 Cyan，再於白天模式覆寫樣式，因此重新載入即可來回切換。首次安裝外掛按 `Ctrl+a`、`Shift+i`。

tmux-continuum 自動儲存設定保留。Ghostty 與 Neovim 的主題仍各自手動切換。
