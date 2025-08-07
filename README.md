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
stow nvim
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

```bash
stow wezterm
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
```

