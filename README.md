# dotfiles

使用 GNU stow 來管理，目前有以下設定檔案，請務必安裝相關件。以下只能在 Ubuntu / MacOS 環境下使用。
請先安裝 GNU stow

使用 Homebrew 安裝
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

安裝 node

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
