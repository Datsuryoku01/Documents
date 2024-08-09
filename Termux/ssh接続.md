# ssh接続
## 手順
### インストール
```bash
pkg install openssh
pkg install nmap
pkg install iproute2
pkg install termux-auth
```

### ユーザ名の確認
```bash
whoami
# 結果：u0_a182 (これは例の一つ) 
```

### パスワードの設定
初期状態ではパスワードが設定されていないので、パスワードを設定します。  
```bash
passwd u0_a182
New password:
Retype new password:
New password was successfully set. 
```

### Termux端末のIPアドレスを確認
```bash
$ ip -4 a | grep inet

#＜結果＞
#inet 127.0.0.1/8 scope host lo
#inet 192.168.1.2/24 brd 192.168.1.255 scope global wlan0 <-- このアドレス
#Termux端末のIPアドレスは192.168.1.2
```

### SSHのポート番号の確認
```bash
$ nmap localhost
#＜結果＞
#Starting Nmap 7.91 ( https://nmap.org ) at 2021-01-28 18:20 +08
#Nmap scan report for localhost (127.0.0.1)
#Host is up (0.0036s latency).
#Not shown: 999 closed ports
#PORT STATE SERVICE
#8022/tcp open oa-system <-- このポート
#Nmap done: 1 IP address (1 host up) scanned in 0.83 seconds  
#この結果では 8022がSSHのポート番号となります。  
```
### 接続の確認
PCのターミナル（Windows Terminalなど）

```
C:\Users\USER>ssh u0_a182@192.168.1.2 -p 8022
u0_a182@192.168.1.2's password:   #Passwordを聞かれるので入力
```
```
(PC画面)  
VirtualBox のubuntuから接続  
ーーー
Welcome to Termux!

Wiki: https://wiki.termux.com
Community forum: https://termux.com/community
Gitter chat: https://gitter.im/termux/termux
IRC channel: #termux on freenode
ーーー
```

### 公開鍵の方法
公開鍵の作成
```bash
ssh-keygen -t rsa
```

何度かEnterキーを押してキーを作る。  
なお、PC側でも公開鍵を作成する。そして作成して公開鍵をTermux側に登録。  
例えば、LINEやメールなどの方法で、PCの公開鍵の内容をスマホに送信して  
Termux内の ~/.ssh/authorized_keys に追記。  

### TermuxでIPアドレスを調べる。
```bash
ifconfig | grep inet
```
PC側で上記IPアドレス(例えば 192.168.0.5など)に接続できる。  
Termuxにパスワードを設定。
```bash
passwd
```

ただし、Termuxでは1024以下のポートが利用できないため、8022番ポートを使うようになっている。  
ログイン時には上記で指定したパスワードが必要。  

```
ssh hoge@192.168.0.5 -p8022
```
## 参考
[アンドロイドスマホ上のLinuxにターミナルで接続してみよう](https://nemlog.nem.social/blog/54919)
