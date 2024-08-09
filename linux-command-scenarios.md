# 日常的なLinuxコマンド使用シナリオ

   ## シナリオ1: ログファイルの分析

   あなたはウェブサーバーの管理者で、最近のアクセスログを分析する必要があります。

   ```bash
   # 最もアクセスの多いIPアドレスTop 10を表示
   cat /var/log/apache2/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 10

   # 特定の日付のログだけを抽出
   grep "01/Aug/2023" /var/log/apache2/access.log > august_1st_logs.txt

   # エラーログから404エラーを抽出し、頻度順にソート
   grep "404" /var/log/apache2/error.log | cut -d'"' -f2 | sort | uniq -c | sort -nr
   ```

   ## シナリオ2: バックアップと圧縮

   重要なプロジェクトファイルを定期的にバックアップする必要があります。

   ```bash
   # プロジェクトディレクトリを日付付きで圧縮
   tar -czvf project_backup_$(date +%Y%m%d).tar.gz /path/to/project

   # 1週間以上前のバックアップを削除
   find /path/to/backups -name "project_backup_*.tar.gz" -mtime +7 -delete

   # バックアップをリモートサーバーに転送
   scp project_backup_$(date +%Y%m%d).tar.gz user@remote_server:/path/to/backups/
   ```

   ## シナリオ3: システムモニタリング

   サーバーのリソース使用状況を監視する必要があります。

   ```bash
   # CPU使用率が高いプロセスTop 5を表示
   ps aux --sort=-%cpu | head -n 6

   # メモリ使用量が多いプロセスTop 5を表示
   ps aux --sort=-%mem | head -n 6

   # ディスク使用率を確認
   df -h

   # 現在のシステム負荷を確認
   uptime
   ```

   これらのシナリオは、実際の業務や個人的なプロジェクトで頻繁に遭遇する状況を想定しています。各コマンドやパイプの使用方法が具体的な文脈の中で示されているため、その有用性と適用方法がより明確になります。
   