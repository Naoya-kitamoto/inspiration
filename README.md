# README

* Name  
  inspiration


* Explanation
  自身のアイデアを投稿してそれに対する他者の考えや意見などを持ち寄ることができる


* URL  
  https://inspiration-39678.onrender.com


* How to Use  
  ・ユーザー登録をしてもらう  
  ・アイデア投稿画面からさまざまな見解が欲しいアイデアを投稿  
  ・投稿されたアイデアを一覧で閲覧でき、投稿をクリックすると詳細ページにいける  
  ・詳細ページにはコメントを書き込むことが可能


* Back Ground  
  自身のひらめきや一瞬のアイデアは具体化されることが少なく、また実現など難しいものである。  
  だが、このアプリケーションを通じてアイデアを投稿することで消えてなくなるはずだったアイデアが実現可能なものになるかもしれない。  
  また他者のアイデアに触発されて全く新しい技術や考えも生み出されるかもしれない。  
  そのような課題を解決するためにこのアプリケーションを開発しました。


* requirement  
  https://docs.google.com/spreadsheets/d/1sznFMGISspUhdtOrk4RabaJdtI9o-9ktI5kuXG_A7gI/edit



* Want to Add  
  ・お気に入り機能  
    今後のコメントが気になるアイデアをマイページに保存するため  
  ・いいね機能  
    どのようなコメントに共感が多く集まるのかを見やすくするため

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
|item               |references |foreign_key: true null: false |
belongs_to :user
belongs_to :idea