# コントリビューションガイドライン

## コミットメッセージ規約

コミットメッセージは、[Conventional Commits 1.0.0](https://www.conventionalcommits.org/ja/v1.0.0/)の仕様を基にした次のような形にしなければなりません。

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

`<type>`は、次のいずれかから適切なものを選択しなければなりません。絵文字は説明用であり、コミットメッセージに含めてはなりません。

- 🛠️ `build`: ビルドシステムや外部依存関係に影響する変更
- ♻️ `chore`: プログラム本体やテスト以外の変更
- ⚙️ `ci`: CI設定ファイルやスクリプトの変更
- 📚 `docs`: ドキュメントのみの変更
- ✨ `feat`: 新機能
- 🐛 `fix`: バグ修正
- 🚀 `perf`: パフォーマンスを改善するコード変更
- 📦 `refactor`: バグ修正や機能追加ではないコード変更
- 🗑️ `revert`: 以前のコミットを取り消す変更
- 💎 `style`: コードに影響を与えない変更（空白、フォーマット、セミコロン不足等）
- 🚨 `test`: 不足しているテストの追加又は既存テストの修正

`<description>`は、先頭を小文字とし、英語の命令形で簡潔に記載しなければなりません。また、末尾にピリオドを付けてはなりません。

許容されるコミットメッセージの例は次のとおりです。

```
feat: add support for additional data formats
```

```
fix: correct incorrect validation logic
```

```
docs: add installation guide for new users
```
