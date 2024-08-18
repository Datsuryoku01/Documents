# pip

|コマンド |	内容 |
|------|-------|
| pip install -U pip | pip自体のアップデート |
| pip install  (package_name) | パッケージのインストール |
| pip install -U (pacage_name) | アップグレード |
| pip install –update (package_name) | アップグレード |
| pip install package_name==version | インストール（バージョン指定） |
| pip list | インストール済みパッケージ名とバージョン一覧 |
| pip list --outdate |	最新版になっていないもののみ表示 |
| pip freeze | インストール済みパッケージ名とバージョン一覧 |
| pip -V | pipのバージョン情報を表示 |
| pip show (package_name) | バージョン情報などを表示 |
| pip download (package_name) | 最新ファイルをDL(インストールはしない) |
| pip help | pipの主要コマンドとオプション一覧を表示 |
| pip (command_name) -h	| コマンドの内容とオプションを表示 |

## 一括アップデート

pip freeze > requirements.txt  
pip install -r requirements.txt  
pip install -r requirements.txt --force-reinstall （再インストール)  

## pipでインストールしたモジュールを全て削除

pip freeze > piplist.txt  
pip uninstall -r piplist.txt  
