kwg
===

Kawo MC Gradle

エクリプス様のプロジェクトにする的アレ

##前提
* エクリプス様
* m2eﾌﾟﾔｸﾞｲﾝ

##使い方
1. セットアップ
  1. マイクラ本体をmaven管理下に置く
    1. マイクラ本体プロジェクトに`マイクラ用pom.xml_xxx`を置いて`pom.xml`にリネーム
    2. エクリプス上でプロジェクトを右クリック＞`構成`＞`mavenプロジェクトに変換`
  2. kwgファイル配備
    1. `kwg.zip`を解凍
    2. kwgディレクトリをプロジェクト化したい場所(ex:`/user/sample`)に置く
    3. kwgディレクトリの中の`properties.gradle`を適宜いい感じにする
    4. kwgディレクトリの中の`build_eclipse.bat`を実行
    5. `/user/sample`がEclipseプロジェクトになるのでエクリプス様でインポート
    6. インポートしたプロジェクトを右クリック＞`構成`＞`mavenプロジェクトに変換`
  3. **わいわい**

2. Zip化作業
  1. `build_mod_compress_fully.bat`を実行
  2. **ウェイｗ**
  3. 二回目以降、本体コードの変更などでupdatemd5が必要な時以外は`build_mod_compress.bat`でウェイｗできる

##
