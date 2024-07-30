#!/bin/bash

# 関数定義：引数として数値リストを受け取り、平均値を計算して返す
function calculate_average() {
  local sum=0
  local count=0

  # 引数として受け取った数値リストを繰り返し処理
  for num in "$@"; do
    sum=$((sum + num))  # 合計値を計算
    count=$((count + 1)) # 要素数をカウント
  done

  # 平均値を計算して返す
  echo $((sum / count))
}

# 変数定義：数値リスト
numbers=(10 25 33 18 42)

# 関数呼び出し：calculate_average 関数に数値リストを渡し、結果を変数に代入
average=$(calculate_average "${numbers[@]}")

# 結果出力
echo "Average: $average"
