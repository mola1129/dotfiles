# dotfiles

Linux向けの最小構成dotfilesリポジトリ

## 概要

このリポジトリには以下の設定ファイルが含まれています:

- `.zshrc` - Zshシェルの設定
- `.gitconfig` - Gitの設定

## インストール

```bash
# リポジトリをクローン
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# ディレクトリに移動
cd ~/dotfiles

# インストールスクリプトを実行
./install.sh
```

インストールスクリプトは、既存の設定ファイルを `~/.dotfiles_backup` にバックアップしてから、シンボリックリンクを作成します。

## 初期設定

### Gitの設定

`.gitconfig` を編集して、ユーザー名とメールアドレスを更新してください:

```bash
vim ~/.gitconfig
```

または直接コマンドで設定:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 含まれる設定

### Zsh (.zshrc)
- コマンド履歴の管理
- カラフルなプロンプト
- 便利なエイリアス (ls, git等)
- 補完機能

### Git (.gitconfig)
- 基本的なエイリアス (st, co, br, ci等)
- カラー設定
- デフォルトブランチ: main

## アンインストール

シンボリックリンクを削除して、バックアップから復元:

```bash
rm ~/.zshrc ~/.gitconfig
cp ~/.dotfiles_backup/.zshrc.* ~/.zshrc
cp ~/.dotfiles_backup/.gitconfig.* ~/.gitconfig
```

## ライセンス

MIT
