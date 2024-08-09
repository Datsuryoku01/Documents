# GUI

[GeminiPDA Termux+XSDL GUI環境をつくる](https://www.incmplt.net/2020/05/18/geminipda-termux-xsdl-gui/)

## Termux で X-Window の方法
Termux X11 Repository インストール
```bash
　pkg install x11-repo
```

## XFCE デスクトップのインストール
```bash
pkg install xfce4
pkg install xfce4-terminal
pkg install netsurf
```

## Xserver XSDL インストール
GooglePlay からアプリをインストール

## GUI環境の利用(XSDL)
最初に Xserver XSDL アプリを立ち上げる

## Termux を立ち上げ、以下のコマンドを実行。
```bash
export DISPLAY=localhost:0
xfce4-session &
```
xfce4-session を起動したら、アプリの切り替えで XSDL の画面が表示。  
少し待つと xfce4 のデスクトップ画面が立ち上がる。  
（この環境でPython-Tkinterが立ち上がった）  



---
Android 用の X Window System / X11 サーバーです。  
一般に、X11 サーバーは VNC と比較すると高速ですが、XSDL には VNC ビューアにあるような美しい UI がありません。
したがって、何を選択するかはあなた次第です。  

## XSDL サーバーを起動する

1. XSDL を開きます。
2. 次に、OS を起動しディストリビューションのシェル内でコマンドを入力します。
```bash
export DISPLAY=127.0.0.1:0 && bash ~/.vnc/xstartup &
```
Wi-Fi ネットワーク上にいて、他のデバイスから XSDL にアクセスしたい場合は、コマンドを次のように変更します。
```bash
export DISPLAY=192.168.0.100:0 && bash ~/.vnc/xstartup &
```

## <参考> Termux のセキュリティ
[_](https://docs.andronix.app/security/termux)
