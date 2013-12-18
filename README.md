kwg
===

Kawo MC Gradle

エクリプス様のプロジェクトにする的アレ

前提

・エクリプス様

・m2eﾌﾟﾔｸﾞｲﾝ

使い方

・マイクラ本体をmaven管理下に置く

　・マイクラ本体プロジェクトにマイクラ用pom.xml_xxxを置いてpom.xmlにリネーム

　・プロジェクトを右クリック＞構成＞mavenプロジェクトに変換

・セットアップ

　・kwg.zipを解凍

　・kwgディレクトリをプロジェクト化したい場所に置く

　・kwgディレクトリの中のproperties.gradleを適宜いい感じにする

　・kwgディレクトリの中のbuild_eclipse.batを実行

　・わいわい

・Zip化作業

　・build_mod_compress_fully.batを実行

　・ウェイｗ

　・二回目以降、本体の更新などでupdatemd5が必要な時以外は
　　build_mod_compress.batでウェイｗできる
