# Linuxの起動プロセス:詳細な解説

Linuxシステムの起動プロセスは、複数の段階を経て行われます。以下に、その主要な段階を順を追って説明します。

## 1. BIOS/UEFI チェック

1. コンピュータの電源を入れると、BIOS（Basic Input/Output System）またはUEFI（Unified Extensible Firmware Interface）が起動します。
2. Power-On Self-Test (POST)と呼ばれる一連のハードウェアチェックが実行されます。
3. POSTが成功すると、BIOSまたはUEFIは次の段階に進みます。

## 2. ブートローダの読み込み

1. BIOSシステムの場合、ハードディスクのMBR（Master Boot Record）からブートローダを読み込みます。
2. UEFIシステムの場合、EFIシステムパーティションから.efiファイルを読み込みます。
3. 多くの現代のLinuxディストリビューションでは、GRUB2（GRand Unified Bootloader version 2）がブートローダとして使用されます。

## 3. カーネルの初期化

1. ブートローダがLinuxカーネルをメモリに読み込みます。
2. カーネルは自身を解凍し、初期化を開始します。
3. ハードウェアの検出と初期化を行います。
4. 初期RAMディスク（initrd）をマウントし、必要なドライバを読み込みます。

## 4. systemdの起動

1. カーネルの初期化が完了すると、systemdが起動します。
2. systemdは現代のLinuxシステムにおいて、初期化プロセスを管理する中心的なプログラムです。
3. システムの各種サービスを順次起動し、ファイルシステムのマウントなどのタスクを実行します。

## 5. ログインプロンプトの表示

1. 全ての初期化プロセスが完了すると、ログインプロンプトが表示されます。
2. ユーザーはここでユーザー名とパスワードを入力してシステムにログインできます。

## 補足：systemdのターゲット

systemdは、旧来のSysVinitシステムの実行レベルに相当する「ターゲット」という概念を使用します。主なターゲットには以下があります：

- multi-user.target: 非グラフィカルなマルチユーザーモード（旧実行レベル3に相当）
- graphical.target: グラフィカルユーザーインターフェース付きのマルチユーザーモード（旧実行レベル5に相当）
- rescue.target: レスキューモード（旧実行レベル1に相当）

現在のターゲットは `systemctl get-default` コマンドで確認できます。

以上が、現代のLinuxシステムにおける一般的な起動プロセスの概要です。具体的な詳細は、使用するLinuxディストリビューション
やハードウェア構成によって多少異なる場合があります。

## Linuxブートプロセスの主要用語解説

| 用語 | 説明 |
|------|------|
| BIOS | Basic Input/Output System の略。コンピュータの起動時に最初に実行される基本的なファームウェア。 |
| UEFI | Unified Extensible Firmware Interface の略。BIOSの現代的な後継で、より高度な機能を持つ。 |
| POST | Power-On Self-Test の略。起動時にハードウェアの基本的な機能をチェックするプロセス。 |
| MBR | Master Boot Record の略。ハードディスクの最初のセクターにあるブートローダ情報を含む領域。 |
| GPT | GUID Partition Table の略。UEFIシステムで使用される、より新しいパーティションテーブル形式。 |
| ブートローダ | オペレーティングシステムを起動するための小さなプログラム。GRUBが一般的。 |
| GRUB | GRand Unified Bootloader の略。多くのLinuxディストリビューションで使用される主要なブートローダ。 |
| カーネル | オペレーティングシステムの中核部分。ハードウェアとソフトウェアの橋渡しをする。 |
| initrd | initial ramdisk の略。起動時に使用される一時的なファイルシステム。 |
| systemd | 多くの現代のLinuxシステムで使用される初期化システム。プロセスの管理や起動を制御する。 |
| ターゲット | systemdにおける、システムの状態や目標を表す概念。旧来のランレベルに相当。 |
| multi-user.target | 複数のユーザーがログイン可能な通常の動作状態を表すsystemdのターゲット。 |
| graphical.target | GUIを使用可能な状態を表すsystemdのターゲット。 |
| ファイルシステム | ディスク上でファイルを組織化し、保存する方法。ext4, XFS, Btrfsなどがある。 |
| デーモン | バックグラウンドで動作し、特定のサービスを提供するプログラム。 |

この表は、Linuxのブートプロセスに関連する主要な用語とその簡単な説明を提供しています。これらの用語を理解することで、
ブートプロセスの各段階で何が起こっているかをより深く把握できるでしょう。

## Linuxブートプロセスの関連ファイル構造

```txt
ROM (Read-Only Memory)
├── BIOS
│   └── MBR (Master Boot Record)
└── UEFI
    └── EFI System Partition
        └── /EFI/
            └── [各ブートローダ].efi

/ (root)
├── boot/
│   ├── grub/
│   │   ├── grub.cfg         # GRUBの主設定ファイル
│   │   └── [その他の設定ファイル]
│   ├── vmlinuz-[version]    # 圧縮されたLinuxカーネル
│   ├── initrd.img-[version] # 初期RAMディスクイメージ
│   └── [その他のカーネルファイル]
├── etc/
│   ├── fstab                # ファイルシステムテーブル
│   ├── default/grub         # GRUBのデフォルト設定
│   └── systemd/
│       ├── system/
│       │   └── [各種.serviceファイル] # systemdサービス設定
│       └── system.conf      # systemdの主設定ファイル
├── lib/
│   └── modules/[kernel-version]/ # カーネルモジュール
├── sbin/
│   └── init -> /lib/systemd/systemd # systemdへのシンボリックリンク
└── usr/
    └── lib/
        └── systemd/
            └── systemd      # systemdバイナリ

[各パーティション]
└── lost+found/              # ファイルシステムチェック用ディレクトリ
```

注意:

1. 実際のファイル構造は、使用しているLinuxディストリビューションやシステム設定によって異なる場合があります。
2. `[version]`や`[kernel-version]`は、インストールされているカーネルのバージョンに応じて変わります。
3. EFIシステムパーティションは、UEFIシステムでのみ存在します。
4. 一部のディストリビューションでは、`/boot`が別パーティションになっている場合があります。
5. `lost+found`ディレクトリは各ファイルシステムのルートに存在しますが、通常は空です。

この構造は、ブートプロセスの主要なステージに関連するファイルの位置を示しています：

- ROM (BIOS/UEFI): システム起動の最初のステージ
- /boot: カーネルとブートローダ関連ファイル
- /etc: システム設定ファイル
- /lib/modules: カーネルモジュール
- /sbin と /usr/lib/systemd: systemd関連ファイル
