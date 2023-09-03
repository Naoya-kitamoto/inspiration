# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


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
belongs_to :item