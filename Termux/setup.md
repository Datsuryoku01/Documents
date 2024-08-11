# termux

**termux関連はすべて自己責任です。何があっても責任はとりません**

Termux をインストールした後

1. 【最初のアップデート】
```bash
apt update && upgrade -y
```

2. 【デバイスのフォルダを共有】
```bash
termux-setup-storage
```

3. 【クリップボードをAndroidと共有する】
```bash
pkg install termux-api
```

4. 【特殊キーの追加】  
.termux/termux.propertiesを作成・追加
```bash
echo "extra-keys = [['DEL','|','_','=','F5','F6','F7'],['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> $HOME/.termux/termux.properties
```
5. 【ubuntu をインストール】
```bash
pkg install proot-distro
proot-distro list
proot-distro install ubuntu
```
6. 【ubuntu ログイン】
```bash
proot-distro login ubuntu
```

7. 【ubuntu のroot のapt を更新】
```bash
apt update && apt upgrade
```
    参考：Storageの位置
    Termuxで見えた Storageの位置は、/sdcardで確認できる

8. 【sodoのインストール】
```bash
apt install -y sudo
```

9. 【ユーザーの作成】
```bash
sudo apt-get install adduser
sudo adduser <ユーザー名>
```  
    ホームディレクトリが作成される  
    #パスワードを設定するのでメモしておくこと / 他は未入力でOK

10. 【ルートのパスワードの設定】
```bash
passwd root
```

11. 【sudoグループに追加、sudo権限の付与】  
sudoグループにユーザーを追加。
確認は、catコマンドで実行できる。
```bash
root$ gpasswd -a  sudo
root$ cat /etc/group | grep sudo
```
- 権限の付与
```bash
echo "<ユーザ名> ALL=(ALL:ALL) ALL"  >  /etc/sudoers
```
- nano /etc/sudoers で編集でも可能  
この内容を追記  
```txt
User privilege specification
root ALL=(ALL:ALL) ALL  
datsu ALL=(ALL:ALL) ALL   
```

12. 【ユーザーへ移動】
```bash
su <ユーザー名>
cd   #ユーザーホームへ移動
pwd    #今どこにいるのか確認
(sudo) ls -a
```
- ユーザーとしてもアップデート＆アップグレードを実施する
```bash
sudo apt update && apt upgrade
```

13. 【一旦ubuntu とTermux を終了させる練習をする】

14. 【ubuntu にログイン】
```bash
proot-distro login --user <ユーザー名> ubuntu    
```

15. 【Python ビルド用のパッケージをインストール】
```bash
sudo apt update
sudo apt install
libdb-dev
libffi-dev
libgdbm-dev
liblzma-dev
libncursesw5-dev
libssl-dev
zlib1g-dev
uuid-dev tk-dev
make
build-essential
libssl-dev
zlib1g-dev  
libbz2-dev
libreadline-dev
libsqlite3-dev
wget
curl
llvm
libncurses5-dev
xz-utils
tk-dev
libxml2-dev
libxmlsec1-dev
libffi-dev
liblzma-dev
```

16. 【.bashrc  の編集】
```bash
dircolors -p > ~/.colorrc #このコマンドを入力
nano ~/.bashrc
```

17. 【日本語設定（ルート権限で）】
```bash
apt install locales
dpkg-reconfigure locales #指示通りに設定
```

18. 【timezone 時間設定（ルート権限で）】
```bash
apt install tzdata #指示通りに設定
```

---

19. 【python3関連のaptパッケージのインストール】
```bash
sudo apt install1 python3 python3-dev python3-venv python3-pip
    python3-setuptools python3-pandas python3-numpy python3-matplotlib
```

20. 【仮想環境を作成】pipなしで作成する
```bash
python3 -m venv --without-pip my01
source my01/bin/activate  #アクティベートしておく
```

21. 【pip関連のダウンロードとインストール】
```bash
python3 get-pip.py
python3 -m venv my01 #setuptools、wheelも作成される
```

22. 【dartsをインストールしてみる】
```bash
error: [Errno 13] Permission denied: '/home/datsu/env/my01/lib/python3.10/site-packages/PyMeeus-0.5.12-py3.10.egg-info/PKG-INFO'
```
このエラーは、パッケージをインストールしようとしている場所に対して、アクセス権がないことを示しています。
sudoを使用して、pipを実行することで、パッケージをインストールする場所に必要な権限を与えることができます。
```bash
sudo python3 -m pip install darts
sudo python3 -m pip install jupyterlab #jupyter labも仮想環境にインストールできた。
```
23. 【vimインストール】
```bash
sudo apt install vim
```
.vimrcの編集
- タイトルを表示  set title
- 行番号の表示 set number
- シンタックスハイライト syntax on
- サーチにハイライト set hlsearch
- 小文字で検索すると大文字と小文字を無視して検索 set smartcase
- ノーマルモードで改行 nnoremap <CR> i<Return><Esc>^k

ーーーーーその他ーーーーー  

24. 【他のpython3 Verのインストール】  
(Pythonの設定)  
①公式サイトからPythonダウンロード】
```bash
wget https://www.python.org/ftp/python/3.8.13/Python-3.8.13.tar.xz
ls -a     #ダウンロードされたか確認の為のコマンド
tar xJf Python-3.8.13.tar.xz      #解凍&展開する
cd Python-3.8.13
./configure    #所要時間 約7分
make           #所要時間 約19分
sudo make install       #所要時間     約5分
```
（Python 確認作業）
```bash
cd
which python3
python3 --version
```
②以下の方法も試せる  

- リポジトリ追加  
```bash
sudo apt install -y software-properties-common
```
- インストール可能なPythonのバージョンを確認
```bash
sudo apt list python3.*
#sudo apt install pythonXX.XX(バージョン)
```

```bash
#Python 各バージョンインストール
sudo apt install -y python3.9 python3.9-venv
sudo apt install -y python3.7 python3.7-venv
sudo apt install -y python3.6 python3.6-venv
```
※venvで仮想環境を分けるため、pythonX.X-venvもインストール。
※pipでビルドが必要になる場合、エラーになるケースがあり。その場合は、pythonX.X-devもインストールしてみる。

25. 【仮想環境を作成】
ここでは、ホームディレクトリ以下全体で使用するmy01という環境名を定義します。
```bash
mkdir ~/env  #仮想環境を作るディレクトリを作成
cd ~/env/  #そのディレクトリに移る
```

次に、仮想環境を作成する。my01のディレクトリを作成し、その中に環境を構築する。
```bash
python3 -m venv my01
```

・作成した環境を有効化
```bash
source ~/venv/python3.9/my01/bin/activate
#プロンプトの左端に(my01)のように環境名が表示されれば、正しく参照されています。
```
・必要なPythonパッケージを仮想環境にインストールする
仮想環境でPython開発に必要なパッケージをインストールします。
ターミナルで次のコマンドを実行します。
```bash
(my01) $ pip install <package-name>
```
・仮想環境をデアクティブ化する
仮想環境から抜けるには次のコマンドを実行
```bash
deactivate
```

**pythonのインストールが上手くいかない時は、以下の方法も参考に**

26. 【仮想環境に setuptools をインストールする】
```bash
wget https://files.pythonhosted.org/packages/a8/d9/28490a9ef6592c3471bd1bcacaf5bd0dee2bb05c8a8bcf901e673b2f1732/setuptools-63.3.0.tar.gz
tar zxf setuptools-63.3.0.tar.gz
cd setuptools-63.3.0
python3 setup.py install       
```

27. 【仮想環境に pip をインストールする】
```bash
wget https://files.pythonhosted.org/packages/46/28/addd7e66bb3af799d35a5dcbb79407b591a7ed674f4efd2bd8f930c40821/pip-22.2.1.tar.gz
tar zxf pip-22.2.1.tar.gz
cd pip-22.2.1
python3 setup.py install      
```
---

28. 【Python環境の切り替え】

- update-alternativesのインストール

Debian の alternatives システムを構成するシンボリックリンクを生成・削除・管理したり、リンクの情報を表示したりするツール  
--helpを確認する。

/etc/alternatives/  
> デフォルトの alternatives ディレクトリ。 --altdir オプションによって変更できる。

```bash
update-alternatives --query python3

update-alternatives --display python3
# update-alternatives: エラー: python3 の alternatives がありません

update-alternatives --config python3
# update-alternatives: エラー: python3 の alternatives がありません

update-alternatives --list python3
# update-alternatives: エラー: python3 の alternatives がありません

シンボリックの登録
```bash
#例えば、下記のように登録する。最後の番号は優先順位
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 130
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
```
書式:  
sudo update-alternatives --install <作成するシンボリックのパス> <グループ名> <実体へのパス> <優先度>  


どのようなバージョンがインストールされて現状の優先バージョンを確認する
```bash
sudo update-alternatives --config python3
```

・Pythonの切り替え方法
Priorityを選択して切り替える方法
```bash
sudo update-alternatives --config python

There are 5 choices for the alternative python (providing /usr/bin/python).
  Selection    Path                Priority   Status
----------------------------------------------
* 0            /usr/bin/python3.9   130      auto mode
  1            /usr/bin/python3.6   100      manual mode
  2            /usr/bin/python3.7   110      manual mode
  3            /usr/bin/python3.8   120      manual mode
  4            /usr/bin/python3.9   130      manual mode

Press <enter> to keep the current choice[*], or type selection number: 
```

のように表示されるので、Selectionの番号を入れてEnterキーを押すと、そのバージョンが有効になります。
※上記はPython 3.9が有効になっている状態です。
```bash
python -V
#Python 3.9.6
```
のように、選択したバージョンになっていればOK。

