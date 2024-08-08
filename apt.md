コマンド	内容

sudo apt list --upgradable
保留

sudo apt update	
パッケージ一覧を更新
( リポジトリ追加・削除時には必ず実行すること )

sudo apt upgrade	
パッケージを更新
(通常のパッケージ更新時はこのコマンドを使用する)

dpkg -L tmux
パッケージがインストールしたファイルを検索する

sudo apt autoremove	
更新に伴い必要なくなったパッケージを削除
(apt実行時にこのコマンドを実行するよう表示されたら実行する)

sudo apt install {パッケージ名やdebファイルのパス}	
パッケージやdebファイルをインストール

sudo apt remove {パッケージ名}
パッケージを削除

sudo apt remove --purge {パッケージ名}	
パッケージを完全削除

sudo apt show {パッケージ名}	
パッケージの詳細情報を表示

sudo apt list {パッケージ名}
パッケージを検索(完全一致)

sudo apt search {パッケージ名}	
パッケージを検索(部分一致)

apt list --installed
インストール済みのパッケージ一覧を表示

sudo dpkg -L {パッケージ名}	パッケージのインストール先を表示

cat /var/log/apt/history.log	aptコマンドの使用履歴を表示

sudo apt autoclean	キャッシュされているが、インストールはされていないdebファイルを削除

sudo apt clean	
キャッシュされている全てのdebファイルを削除

apt moo	Super Cow Powersを発動 (詳しくはスーパー牛さんパワー！ - ぬいぐるみライフ？参照)

echo "{パッケージ名} hold" | dpkg --set-selections	パッケージをアップデート対象から除外

echo "{パッケージ名} install" | dpkg --set-selections	パッケージをアップデート対象に戻す
