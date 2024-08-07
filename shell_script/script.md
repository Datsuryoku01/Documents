# 入出力

## 標準入力・標準出力・標準エラー出力

「標準入力」・「標準出力」・「標準エラー出力」にはそれぞれ次のように番号が割り振られています。

|  意味     |  番号    |  デバイス | 
| -------- | -------- | ------- |
| 標準入力       |  0  | キーボード |
| 標準出力       |  1  | ディスプレイ |
| 標準エラー出力  |  2  | ディスプレイ |

そして、大なり記号 > は、実は 1> のように数字の"1"が省略されています。 同様にして2> も使える。  
例えば  

```bash
command 2> error.txt
#commandを実行した際に表示されたエラーの内容が、error.txtに出力される
```

以下は、存在しないコマンドkjfklsajfを実行した例です：
```bash
kjfklsajf
# command not found: kjfklsajf

kjfklsajf 2> error.txt
#error.txtに出力
```

一回目の実行では「command not found: kjfklsajf」とエラーである旨が表示されました。  
しかし、二回目ではそのエラーを2>を使ってerror.txtに出力したため、結果的にerror.txtに「command not found: kjfklsajf」が書き込まれました。  
また、エラー出力を追記するなら2>>を使えばよいということです。  

- 標準出力と標準エラー出力を同じファイルへ
```bash
command > file.txt 2>&1
```

これは「file.txtに標準出力と標準エラー出力を書き込む」という意味です。
末尾にある2>&1より、標準エラー出力先は、現在の標準出力先、つまりfile.txtということです。

標準出力と標準エラー出力を同じファイルに書き込みたい場合は特別な記法があり
```sh
command &> file.txt
```
と実行すれば実現できます。


##  >を使ってファイルに出力する
役割：コマンドの実行結果を指定のファイルへ直接出力してくれる
```bash
echo "お金" > result.txt
#result.txtに「お金」が書き込まれる。
```
続けて、
```bash
echo "ほしい" > result.txt
# >はファイルに上書きされる
```
追記をするには>の代わりに>>を使います。
```bash
echo "お金" > result.txt
echo "ほしい" >> result.txt
#result.txtには「お金」と「ほしい」の両方が書き込まれます。
```

## 数値を比較する(比較演算子）

| 演算子 | 書き方 | 意味 | 例  |
|-----|------|-------|------|
| eq  | x -eq y | x = y | \[ 5 -eq 5 \] && echo "True"→ True |
| ge  | x -ge y | x >= y | \[ 5-ge 3 \] && echo "True" → True |
| gt  | x -gt y | x > y | \[ 5-gt 3 \] && echo "True" → True |
| le  | x -le y | x <= Y | \[ 3-le 5 \] && echo "True" → True |
| It  | x -lt y | x < y | \[ 3-It 5 \] && echo "True" → True |
| ne  | x -ne y | x != y | \[ 1 -ne 2 ]\ && echo "True" → True |

```bash
#!/bin/bash

count=10

if [ $count -gt 5 ]; then
    echo "countは5より大きい"
else
    echo "countは5以下"
fi
```


$(( )) 内部の数式を数値として評価  
書き方は計算したい式を、 $(( と ))で囲みます。  
比較結果として、真の場合は 1、偽の場合は 0 が返されます。  

| 演算子 |  例  |  結 果  |
| ------ | ------| -----|
| >   | echo $(( 2 > 3 )) | 0 |
| ==  | echo $(( 2 == 3)) | 0 |
| !=  | echo $(( 2 != 3 )) | 1 |
| <   | echo $(( 2 < 3 ))  | 1 |

