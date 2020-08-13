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


# テーブル設計

## users テーブル

| Column       | Type     | Options    |
| ------------ | -------- | ---------- |
| nickname     | string   | null:false |
| email        | string   | null:false |
| password     | string   | null:false |
| name         | string   | null:false |
| name_reading | string   | null:false |
| birthday     | datetime | null:false |

## Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type     | Options    |
| ----------------- | -------- | ---------- |
| item_name         | string   | null:false |
| comment           | text     | null:false |
| cost              | integer  | null:false |
| category          | string   | null:false |
| product_status    | string   | null:false |
| fee               | integer  | null:false |
| origin_prefecture | string   | null:false |
| delivery_days     | string   | null:false |

## Association

- belongs_to :user
- has_one_attached :image
- has_one :order

## image
| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| image  | references | null:false, foreign_key:true |


## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

## Association

- has_one :user
- belongs_to :item
- has_one :address

## Addressテーブル

| Column          | Type     | Options    |
| --------------- | -------- | ---------- |
| postal_code     | integer  | null:false |
| prefecture      | string   | null:false |
| city            | string   | null:false |
| house_number    | string   | null:false |
| building_number | string   |            |
| phone_number    | integer  | null:false |

## Association

- belongs_to :order