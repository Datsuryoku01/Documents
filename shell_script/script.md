標準入力　= キーボード
標準出力　= ディスプレイ
標準エラー出力　= ディスプレイ


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


- 数値を比較する(比較演算子）

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

