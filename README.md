# README

* アプリケーション名  
  inspiration


* アプリケーションの説明  
  自身のアイデアを投稿してそれに対する他者の考えや意見などを持ち寄ることができます。


* URL  
  https://inspiration-39678.onrender.com


* 使い方  
  ・ユーザー登録をしてもらう  
  ・アイデア投稿画面からさまざまな見解が欲しいアイデアを投稿  
  ・投稿されたアイデアを一覧で閲覧でき、投稿をクリックすると詳細ページにいける  
  ・詳細ページにはコメントを書き込むことが可能


* 開発背景  
  自身のひらめきや一瞬のアイデアは具体化されることが少なく、また実現など難しいものです。  
  だが、このアプリケーションを通じてアイデアを投稿することで消えてなくなるはずだったアイデアが実現可能なものになるかもしれません。  
  また他者のアイデアに触発されて全く新しい技術や考えが生み出されることもあるかもしれません。  
  そのような課題を解決するためにこのアプリケーションを開発しました。


* 要件定義  
  https://docs.google.com/spreadsheets/d/1sznFMGISspUhdtOrk4RabaJdtI9o-9ktI5kuXG_A7gI/edit



* 追加予定の機能  
  ・お気に入り機能  
    今後のコメントが気になるアイデアをマイページに保存するために優先して実装したいです。  
  ・いいね機能  
    どのようなコメントに共感が多く集まるのかを見やすくするために実装したいです。  


* ER図  
  [![Image from Gyazo](https://i.gyazo.com/f7ad77a5be590bf829ceedb3a5ee692f.png)](https://gyazo.com/f7ad77a5be590bf829ceedb3a5ee692f)


* 画面遷移図
  [![Image from Gyazo](https://i.gyazo.com/b5582a752ad7adee5624a2ed4c18d10b.png)](https://gyazo.com/b5582a752ad7adee5624a2ed4c18d10b)



* 開発環境  
  Ruby on Rails  
* 本番環境  
  Render  



* 工夫したポイント  
  色々な機能を追加せずに使いやすくシンプルなデザインにしました。  
  また、いつ、どんなアイデアが他者を動かすのかわからないため投稿の削除機能と編集機能を作りませんでした。  



* 改善点  
  削除、編集機能は今後も追加する予定はありませんが、投稿に対してこれ以上コメントができないような機能を実装したいと思っています。  



* 制作時間  
  およそ40時間  



## usersテーブル
|Column             |Type       |Options                  |
|-------------------|-----------|-------------------------|
|nickname           |string     |null: false              |
|email              |string     |null: false unique: true |
|encrypted_password |string     |null: false              |
|first_name         |string     |null: false              |
|last_name          |string     |null: false              |
|first_name_kana    |string     |null: false              |
|last_name_kana     |string     |null: false              |
has_many :ideas
has_many :comments

## ideasテーブル
|Column             |Type       |Options                  |
|-------------------|-----------|-------------------------|
|user               |references |foreign_key: true null: false |
|title              |string     |null: false              |
|subject            |text       |null: false              |
|category_id        |integer    |null: false              |
belongs_to :user
has_many :comments

## commentsテーブル
|Column             |Type       |Options                   |
|-------------------|-----------|--------------------------|
|comment            |text       |null: false               |
|user               |references |foreign_key: true null: false |
|idea               |references |foreign_key: true null: false |
belongs_to :user
belongs_to :idea