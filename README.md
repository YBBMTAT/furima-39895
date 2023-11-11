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
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| encrypted_password | string | null: false              |
| email              | string | null: false,unique: true |
| pbirthday          | text   | null: false              |

has_many :items
has_many :buys

## itemsテーブル
| Column     | Type   | Options                      |
| ---------- | ------ | ---------------------------- |
|image       | text   | null: false----------------- |
|item_name   | text   | null: false----------------- |
|price       | integer| null: false----------------- |
|description | text   | null: false----------------- |
|category    | text   | null: false----------------- |
|condition   | text   | null: false----------------- |
|postage     | integer| null: false----------------- |
|hometown    | text   | null: false----------------- |
|leadtime    | text   | null: false----------------- |
|coment      | text   | null: false----------------- |
|user        | string | null: false,foreign_key: true|

### Association
belongs_to :users
has_one:buys

## buysテーブル
| Column     | Type   | Options                      |
| ---------- | ------ | ---------------------------- |
| user------ | string | null: false,foreign_key: true|
| item------ | string | null: false,foreign_key: true|
| purchaser- | string | null: false,foreign_key: true|

### Association
belongs_to :items
belongs_to:user
has_one:shipments

## shipmentsテーブル
| Column      | Type    | Options                      |
| ----------- | ------  | ---------------------------- |
| address     | string  | null: false----------------- |
| prefectures | text    | null: false----------------- |
| city        | text    | null: false----------------- |
| street_num  | text    | null: false----------------- |
| building    | text    | null: false----------------- |
| street_num  | text    | null: false----------------- |
| phone       | integer | null: false----------------- |

### Association
belongs_to :buys