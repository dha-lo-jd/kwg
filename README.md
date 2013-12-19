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

##`properties.gradle`プロパティ詳解
解説ウーンウーンっつってる

> 用意した`properties.gradle`はいくつかの値を共有するために変数(ex:`def mcVersion = '1.6.4'`)を使っているが、
本質的にはpropertiesに適切な値が設定されていればよい。

1. ディレクトリ関係
	1. properties.forge
	3. properties.mod.repos  
		`baseLocation` : `リポジトリのルートのパス`  
		`mod.location` : `baseLocationからのMODのリポジトリのパス`  
		`mod.srcRoot` : `mod.locationからのソース置き場のパス`  
		`mod.testSrcRoot` : `mod.locationからのテストソース置き場のパス` *(オプション)*  
		`mod.resRoot` : `mod.locationからのリソース置き場のパス`  *(オプション)*  
	4. properties.mod.project  
		`reposLinkRoot` : `プロジェクトからソースへのリンクをするルートのパス`  
	5. properties.mcp  
		`working.base` : `MCP作業用ディレクトリのパス(未使用)`  
		`working.location` : `このMODのMCP作業用ディレクトリのパス`  
	5. 動き(伝われ)  
	MODSAMPLEというMOD(ソースの場所はMODSAMPLE/src/org/lo/d/sample/*.java)の配置例
		1. パターン１(リポジトリがソースの特定パッケージ(ex:`org.lo.d.sample`)をルートにしているケース)
			1. 物理的配置
				1. /hoge/fuga/repos(リポジトリ) <-`properties.mod.repos.baseLocation : "/hoge/fuga/repos"`
					* /MODSAMPLE  <-`mod.location : "MODSAMPLE"`
						* *.java <-`mod.srcRoot : ""`  
						リポジトリ直下にソースがあるので`mod.srcRoot`は空にする
				2. /foo/bar/projects(プロジェクト)
					* /MODSAMPLE(MODSAMPLEプロジェクトのルート) <-`gradle起動場所なので自動的に認識される`
						* /kwg <-`解凍したフォルダを置く`
						* .project
				3. /jane/john/working(作業ディレクトリ)
					* /MODSAMPLE <-`working.location : "/jane/john/working/MODSAMPLE"`  
					このディレクトリを使って難読化などの処理を行うため必須  
					ソースの削除やコピーを行うのでプロジェクトやリポジトリの場所と別の場所にする
			2. インポートした後のエクリプス上の見た目
				* MODSAMPLE <-`プロジェクトのルート:/foo/bar/projects/MODSAMPLE`
					* /kwg
					* /src
						* /org/lo/d/sample <-`properties.mod.project.reposLinkRoot : "org/lo/d/sample"`  
						-->/hoge/fuga/repos/MODSAMPLE へのリンク `properties.mod.repos.baseLocation`/`properties.mod.repos.mod.location`/`properties.mod.repos.mod.srcRoot`  
						sampleディレクトリがソースへのリンクになる  
		2. パターン２(リポジトリにソース、リソースそれぞれのルートディレクトリをコミットしている例)
			1. 物理的配置
				1. /hoge/fuga/repos(リポジトリ) <-`properties.mod.repos.baseLocation : "/hoge/fuga/repos"`
					* /MODSAMPLE <-`mod.location : "MODSAMPLE"`
						* /src(ソースディレクトリ) <- `mod.srcRoot : "src"`
							* /org/lo/d/sample
								* *.java
						* /res(リソースディレクトリ) <- `mod.resRoot : "res"`
							* /assets/modsample/textures/blocks
								* *.png  
				2. /foo/bar/projects(プロジェクト)
					* /MODSAMPLE(MODSAMPLEプロジェクトのルート) <-`gradle起動場所なので自動的に認識される`
						* /kwg <-`解凍したフォルダを置く`
						* .project
				3. /jane/john/working(作業ディレクトリ)
					* /MODSAMPLE <-`working.location : "/jane/john/working/MODSAMPLE"`  
					このディレクトリを使って難読化などの処理を行うため必須  
					ソースの削除やコピーを行うのでプロジェクトやリポジトリの場所と別の場所にする  
			2. インポートした後のエクリプス上の見た目
				* MODSAMPLE <-`プロジェクトのルート:/foo/bar/projects/MODSAMPLE`
					* /kwg
					* /src <-`properties.mod.project.reposLinkRoot : ""`  
					-->/hoge/fuga/repos/MODSAMPLE/src へのリンク `properties.mod.repos.baseLocation`/`properties.mod.repos.mod.location`/`properties.mod.repos.mod.srcRoot`  
					srcディレクトリがソースへのリンクになる  
					* /res  
					-->/hoge/fuga/repos/MODSAMPLE/res へのリンク `properties.mod.repos.baseLocation`/`properties.mod.repos.mod.location`/`properties.mod.repos.mod.resRoot`  
					resディレクトリがリソースへのリンクになる
		3. パターン３(リポジトリをそのままプロジェクトにするパッタン)
			1. 物理的配置
				1. /hoge/fuga/repos(リポジトリ) <-`properties.mod.repos.baseLocation : "/hoge/fuga/repos"`
				2. **/hoge/fuga/repos**(プロジェクト)
					* /MODSAMPLE(MODSAMPLEプロジェクトのルート) <-`mod.location : "MODSAMPLE"` <-`gradle起動場所なので自動的に認識される`  
						リポジトリ`mod.location`と同じ場所にある場合、リンクを作成しない
						* /src(ソースディレクトリ) <- `mod.srcRoot : "src"`
							* /org/lo/d/sample
								* *.java
						* /res(リソースディレクトリ) <- `mod.resRoot : "res"`
							* /assets/modsample/textures/blocks
								* *.png
						* /kwg <-`解凍したフォルダを置く`
						* .project
				3. /jane/john/working(作業ディレクトリ)
					* /MODSAMPLE <-`working.location : "/jane/john/working/MODSAMPLE"`  
					このディレクトリを使って難読化などの処理を行うため必須  
					ソースの削除やコピーを行うのでプロジェクトやリポジトリの場所と別の場所にする  
			2. インポートした後のエクリプス上の見た目
				* MODSAMPLE <-`プロジェクトのルート:/foo/bar/projects/MODSAMPLE`
					* /kwg
					* /src
					* /res
