# Draft PR 作成コマンド

以下の手順でDraft Pull Requestを作成してください。

## 手順

### 1. ブランチ確認・作成

現在のブランチを確認します。
```
git branch --show-current
```

main または master ブランチの場合は、変更内容を元に適切な名前で新しいブランチを作成します。
ブランチ名は `feature/`, `fix/`, `chore/` などのプレフィックスを使ったkebab-case にしてください。

### 2. 差分確認

以下のコマンドで変更を確認します。
```
git status
git diff HEAD
git diff --staged
```

### 3. コミット作成

差分を確認し、論理的にまとまった単位でコミットを作成します。
- 1つのコミットに詰め込みすぎず、意味のある単位に分割する
- コミットメッセージは変更内容を簡潔に英語で記述する

### 4. Draft PR 作成

`gh pr create --draft` でDraft PRを作成します。

PRの説明は以下の形式にしてください：

```
## What

- 変更内容を箇条書きでサマリー（差分から読み取る）

## Why

変更の背景や目的を推測して記述する
```

$ARGUMENTS
