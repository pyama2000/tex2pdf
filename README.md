# TeX2PDF

GitHub Actions でプッシュされたTeXファイルをLuaLaTeX + llmk + 原ノ味フォントを利用できるDockerイメージ
でコンパイルし、releaseに公開するリポジトリ

## タグ命名規則

`v*.*.*`でタグ付けを行う。  
最初の数字は2019年を`1`として年々1ずつ増加する。  
2番目はそのTeXファイルがその年の何番目かを表す。  
3番目はそのTeXファイルを修正した回数を表す。

## PDFファイルを生成する

**texfiles**以下に**XXX.tex**を作成し、**texfiles/llmk.toml**内を`source = "XXX.tex"`に変更する。  
あとはタグ付けし、リポジトリにプッシュするだけでGitHub Actions が走り、PDFファイルを生成する。

```shell
$ touch texfiles/XXX.tex
$ vim texfiles/llmk.toml
$ git add texfiles/XXX.tex texfiles/llmk.toml
$ git commit
$ git tag -a -v vX.X.X -m "XXX"
$ git push origin master vX.X.X
```
