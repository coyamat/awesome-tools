# awesome-tools

This is my BONSAI.

## Homebrew

https://brew.sh/

## TouchIDでsudo

[macOS Sonoma 14.xでsudo実行時にTouch IDで認証する機能を有効化する手順 #macOS - Qiita](https://qiita.com/notakaos/items/fbc817741d43f24bf300)

## Desktop Applications

```
brew install \
  iterm \
  raycast \
  visual-studio-code \
  meetingbar \
  podman-desktop \
  alt-tab \
  rectangle \
  hiddenbar \
  macdown \
  ;
```

## CLI Tools

Required:

```
brew install \
  coreutils \
  findutils \
  diffutils \
  binutils \
  gawk \
  gnu-sed \
  gnu-tar \
  grep \
  ag \
  make \
  htop \
  pidof \
  pyenv \
  nodenv \
  fzf \
  peco \
  ghq \
  kubectl \
  kubectx \
  krew \
  gh \
  gdrive \
  jq \
  yq \
  ynqa/tap/jnv \
  glow \
  bat \
  terminal-notifier \
  ;
```

Optional:

```
brew install \
  awscli \
  google-cloud-sdk \
  cloudflared \
  bitwarden-cli \
  kind \
  ;
```

## Other Tools

- [seachicken/gh-poi: ✨ Safely clean up your local branches](https://github.com/seachicken/gh-poi)
- [macOSのメニューバーのアイコンを非表示にするアプリ #macOS - Qiita](https://qiita.com/tomoyk/items/8e6113b06b6f385c71f8)

## Zshrc

Install

```
brew install \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  ;
```

Setup

```
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

## Bookmarklet

[bookmarklet.md](https://gist.github.com/tomoyk/673926c1b7d4203355a4b1ca2a98b0a7)

