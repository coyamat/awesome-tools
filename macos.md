# awesome-tools

This is my BONSAI.

## Homebrew

https://brew.sh/

## TouchIDでsudo

```
$ sw_vers
ProductName:		macOS
ProductVersion:		14.5
BuildVersion:		23F79

# If Product Version is greater than 14.0
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
```

[macOS Sonoma 14.xでsudo実行時にTouch IDで認証する機能を有効化する手順 #macOS - Qiita](https://qiita.com/notakaos/items/fbc817741d43f24bf300)

## Desktop Applications

```
brew install \
  alt-tab \
  hiddenbar \
  iterm2 \
  macdown \
  meetingbar \
  podman-desktop \
  raycast \
  rectangle \
  homerow \
  visual-studio-code \
  ;
```

## CLI Tools

Required:

```
brew install \
  ag \
  bat \
  binutils \
  coreutils \
  diffutils \
  findutils \
  fzf \
  gawk \
  gdrive \
  gh \
  ghq \
  glow \
  gnu-sed \
  gnu-tar \
  grep \
  htop \
  jq \
  krew \
  kubectl \
  kubectx \
  make \
  nodenv \
  peco \
  pidof \
  pyenv \
  ripgrep \
  shellcheck \
  terminal-notifier \
  tmux \
  tmux-xpanes \
  watch \
  wget \
  ynqa/tap/jnv \
  yq \
  zoxide \
  ;
```

Optional:

```
brew install \
  awscli \
  bitwarden-cli \
  cloudflared \
  google-cloud-sdk \
  kind \
  1password-cli \
  ;
```

## zshrc

```
brew install \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  ;
```

## Other Tools

- [seachicken/gh-poi: ✨ Safely clean up your local branches](https://github.com/seachicken/gh-poi)
- [macOSのメニューバーのアイコンを非表示にするアプリ #macOS - Qiita](https://qiita.com/tomoyk/items/8e6113b06b6f385c71f8)

## Bookmarklet

[bookmarklet.md](https://gist.github.com/tomoyk/673926c1b7d4203355a4b1ca2a98b0a7)

