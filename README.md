# Smarty News

# 制作理由

iosアプリケーションの作成を通じて以下の目的を達成する:

* swiftという言語の学習
* xcodeの運用方法
* XMLの使用、アプリケーションへの導入方法の学習
* podの導入、外部ライブラリの使用法の学習
* githubの運用方法

* 今後の課題
  * 本アプリケーションにおいては、他SNS等にニュース情報を共有できるように実装するとアプリケーションとしての利便性が向上すると考えられる。
  * 他アプリケーションの作成を通じて、XMLの運用や外部ライブラリ導入方法を着実にマスターしたいと考える。
  
# 苦労した点
- versionによる相違
  - iosのバージョンにより推奨される記述方法に違いがあり、エラーを検索しても求めている記述が探し出せない。
- 経験にない実装
  - iosアプリケーションを作成することは初めてなので、どれも経験にない実装であるが特にXMLをパースするという処理は理解に苦しんだ。
- エラーの対処
  - Error: Multiple commands produce
  - No such module 'ライブラリ名'
  - 'WBSegmentControl' (project 'Pods') has copy command from
  #### 上記エラーの解決には手を焼き、特に解決しないとbuildができないエラーであったため、エラー文を検索にかけて参考記事の対処法を色々試した。
  
# 作成手順
 - ニュース画面の作成
 - メニュー画面の作成
 - 引っ張って更新する処理の記載
 - TableViewの作成
 - Webviewの作成
 - ニュース情報XMLのパース
 - XML情報の取得
 - ニュース表示後の進む、戻る処理
 - ニュースのサムネイル画像の取得
 - pods導入
 - CocoaPods導入
 - WBSegmentControl導入（タブ切り替えのため）
 - SDWebImageの導入
 - 一機能実装ごとにシュミレーターにて作動確認
 
# 挙動
## アプリ起動時

[![Image from Gyazo](https://i.gyazo.com/b37840bf89f724dbace6afe7b101c3ce.gif)](https://gyazo.com/b37840bf89f724dbace6afe7b101c3ce)
## タブ切り替え遷移

[![Image from Gyazo](https://i.gyazo.com/a914d6ec771f3fe4d25e1f99f0617206.gif)](https://gyazo.com/a914d6ec771f3fe4d25e1f99f0617206)

## ニュースをみる
[![Image from Gyazo](https://i.gyazo.com/01fd724c70fc65672bb17a1146ffcc9e.gif)](https://gyazo.com/01fd724c70fc65672bb17a1146ffcc9e)

## 1ページ進む
[![Image from Gyazo](https://i.gyazo.com/f1bc125ed4f8575bfef550ff58e9b359.gif)](https://gyazo.com/f1bc125ed4f8575bfef550ff58e9b359)

## 1ページ戻る
[![Image from Gyazo](https://i.gyazo.com/ed6201f520a432d48abcdc45b8b48e38.gif)](https://gyazo.com/ed6201f520a432d48abcdc45b8b48e38)

## 閉じるボタン
[![Image from Gyazo](https://i.gyazo.com/2181c7773835d48611fb3f6b77f1f192.gif)](https://gyazo.com/2181c7773835d48611fb3f6b77f1f192)

## 引っ張って更新
[![Image from Gyazo](https://i.gyazo.com/63311bf247300d76d23cf56121379504.gif)](https://gyazo.com/63311bf247300d76d23cf56121379504)


[![Image from Gyazo](https://i.gyazo.com/9203f1492d3fd6c7e69909f15f6bd589.gif)](https://gyazo.com/9203f1492d3fd6c7e69909f15f6bd589)

# 課題
 - ios12.0においてはUIWebViewの使用は非推奨であったためWKWebViewを使用し、当初は実装していたが上手くページ遷移ができず実装にかなりの時間を要したため、UIWebViewを使用しての実装へと切り替えた。今後はWKWebViewでの実装が主流となっていくと考えられるため、WKWebViewを使いこなせるように公式リファレンスや該当記事を見つけ出して学習に努めていきたいところである。
 
 - 外部ライブラリの使用に関しては、二重にxcodeに読み込んでしまい、`Error: Multiple commands produce`のエラーを解決することに多くの時間を要してしまった。該当ファイルを削除し、`build system`を`Legacy build system`に変更することで`build`が成功する状態となってアプリケーションは作動するが、`build system`を古い状態にするということは後ろ向きのアプローチであると考えられるため、今後は対処法を考えていく必要があると感じている。
 
# あとがき
`Ruby on Rails`を学習後に何か新しく言語を学びたいと考えていました。どの言語を学ぼうかと考えた時に私が一番に意識したことはアプリケーションを使用するuserはどのツールを使用してアプリケーションを使用、閲覧するのかということである。現在では多くの人が携帯端末を使用してアプリケーションを使用しています。そして日本においては`iphone`を使用しているuserが多く、また自身も使用しているため、モダンな言語の学習、国内シェア率の高さ、自身のアプリケーション開発環境の構築のしやすさ、モバイルアプリケーションに特化しているということを考慮した結果、`swift`を使用してアプリケーションの作成に取り組むことに決めました。
今までのアプリケーション作成時には`web api`による`json`データを取得してアプリケーションを作成することが多かったが、今回の外部データの取得方法では`XML`を使用しています。今までに経験にない実装方法を試すことは最初は不安であるが、終わってもみれば自身の知見が広がったと感じることができ、成長の一面を感じられました。一方で実装はできるけれども、本当に理解しているのかということは常に考えて、知識を着実に身につけていくことが今後は必要になってくると考えています。
これからも多くのアプリケーションをの作成を通じて、技術と知識のインプットとアウトプットを行なっていきたいと考えています。




