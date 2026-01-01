# dotfiles

使用 GNU stow 來管理，目前有以下設定檔案，請務必安裝相關件。以下只能在 Ubuntu / MacOS 環境下使用。
請先安裝 GNU stow

建議安裝 Homebrew，很爽
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

使用 Homebrew 安裝 stow
```brew
brew install stow
```

## nvim

```bash
stow neovim
```

```bash
sudo apt-get install ripgrep -y
sudo apt install gcc -y
sudo apt install curl -y
sudo apt-get install build-essential -y
sudo apt-get install unzip -y
sudo apt-get install git-all -y
```

安裝 node，與時俱進[ 連結 ](https://nodejs.org/en/download)

```
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.17.1".
nvm current # Should print "v22.17.1".

# Verify npm version:
npm -v # Should print "10.9.2".
```

Check your $XDG_SESSION_TYPE 
```bash
echo $XDG_SESSION_TYPE
```

If it is `x11`, you need to install `xclip` for clipboard support in Neovim.
```bash
sudo apt install xclip
```
If it is `wayland`, you need to install `wl-clipboard` for clipboard support in Neovim.
```bash
sudo apt install wl-clipboard
```

Note that Anydesk does not support Wayland, what a miserable situation QQ.

建議在裝好後執行 `:checkhealth telescope` 來看看有沒有缺少 telescope 建議的套件，像是 ripgrep 或者 fd 都是可以更快速找大 codebase 的好東西
直接執行 `:checkhealth` 也可以

如果你遇到 `Failed to run config for nvim-treesitter` 的問題，可以嘗試把 `:~/.local/share/nvim/lazy/nvim-treesitter` 從 main branch 切換到 master branch，我是參考[這個 reddit 討論的](https://www.reddit.com/r/neovim/comments/1nvf3ss/neovim_treesitter_error/)

## zsh

```bash
stow zsh
```

安裝 oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

安裝其他套件

- https://github.com/zdharma-continuum/fast-syntax-highlighting
```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```
- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## wezterm

Update: I think Alacritty is better than Wezterm, especially when using it with Anydesk. I always feel laggy with Wezterm, so I switched to Alacritty (On Ubuntu). However, Wezterm is still a great terminal emulator with many features, so I keep it here and use it on MacOS.

[ 官方連結 ](https://wezfurlong.org/wezterm/)

```bash
stow wezterm
```

查看可以用的字體
```bash
fc-list
```

## alacritty

A replacement for Wezterm
[ 官方連結 ](https://alacritty.org/config-alacritty.html)

```bash
stow alacritty
```

Install Alacritty on Ubuntu:
```bash
sudo apt install alacritty
```

## Tmux

```bash
stow tmux
```

安裝 TPM，參考 [ GitHub repo ](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


## Starship

[ 官方連結 ](https://starship.rs/)

```bash
stow starship
```

## i3wm

When using Ubuntu, I use i3 window manager, which is a tiling window manager. You can install it with the following command:

ref: https://i3wm.org/docs/repositories.html

```bash
sudo apt install i3
sudo apt install rofi # use rofi instead of dmenu, because it's cooler
sudo apt install feh # for setting wallpaper
sudo apt install picom # compositor for transparency (in my case, wezterm needs it to be transparent)
```

截圖軟體使用 flameshot
```bash
sudo apt install flameshot
```

## picom

I use picom to round the corners of windows and set transparency. You can install it with the following command:

```bash
stow picom
```
install it
```bash
sudo apt install picom
```

## 其他設定

### 桌布

使用 feh 設定桌布，將下載好的桌布放在 `~/Wallpapers` 資料夾下，然後執行以下指令：

```bash
feh --bg-scale ~/Wallpapers/your_wallpaper.jpg # 這一行也有放在 i3 的設定檔中
```

### Zen Browser
一個跟 Arc 很像的瀏覽器，這邊我是使用 flatpak 來安裝的
參考 https://flathub.org/apps/app.zen_browser.zen

### iBus Chewing
新酷音輸入法，在 i3 環境下使用要特別設定
```bash
sudo apt install ibus-chewing ibus
```
然後在終端機設定 ibus 新增 chewing 輸入法

```bash
ibus-setup
```

安裝酷酷的 bar
```bash
sudo apt install polybar
```
設定 https://github.com/polybar/polybar/wiki

### 安裝字體

你可以到這個網站去下載 JetBrain 字體，然後把有 `.ttf` 的檔案放到 `~/.local/share/fonts`
因為這個設定檔的所有字體都是用 JetBrain

https://www.nerdfonts.com/font-downloads

### 多螢幕

如果你有多個螢幕要設定，可以用 arandr 這個工具

```bash
sudo apt install arandr
```

## TODOs
- [ ] multi monitor
