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
| kanji_last_name    | string | null: false              |
| kanji_first_name   | string | null: false              |
| kana_last_name     | string | null: false              |
| kana_first_name    | string | null: false              |
| pbirthday          | date   | null: false              |

has_many :items
has_many :buys

## itemsテーブル
| Column        | Type   | Options                      |
| ------------  | ------ | ---------------------------- |
|item_name      | string | null: false----------------- |
|price          | integer| null: false----------------- |
|description    | text   | null: false----------------- |
|category_id    | text   | null: false----------------- |
|condition_id   | text   | null: false----------------- |
|postage_id     | integer| null: false----------------- |
|prefectures_id | text   | null: false----------------- |
|leadtime_id    | text   | null: false----------------- |
|user           | string | null: false,foreign_key: true|

### Association
belongs_to :user
has_one:buy

## buysテーブル
| Column     | Type       | Options                      |
| ---------- | ---------- | ---------------------------- |
| user       | references | null: false,foreign_key: true|
| item       | references | null: false,foreign_key: true|

### Association
belongs_to :item
belongs_to:user
has_one:shipment

## shipmentsテーブル
| Column         | Type       | Options                         |
| -------------- | ---------  | ------------------------------- |
| address        | string     | null: false-------------------- |
| prefectures_id | text       | null: false-------------------- |
| city           | text       | null: false-------------------- |
| street_num     | text       | null: false-------------------- |
| building       | text       |                                 |
| street_num     | text       | null: false-------------------- |
| phone          | string     | null: false-------------------- |
| user           | references | null: false,foreign_key: true   |
| item           | references | null: false,foreign_key: true   |

### Association
belongs_to :buy

