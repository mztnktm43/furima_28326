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

| Column              | Type   | Options    |
| ------------------- | ------ | ---------- |
| nickname            | string | null:false |
| email               | string | null:false |
| password            | string | null:false |
| family_name         | string | null:false |
| family_name_reading | string | null:false |
| first_name          | string | null:false |
| first_name_reading  | string | null:false |
| birthday            | date   | null:false |

## Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| user              | references | null:false, foreign_key:true |
| name              | string     | null:false                   |
| comment           | text       | null:false                   |
| cost              | integer    | null:false                   |
| category_id       | integer    | null:false                   |
| product_status_id | integer    | null:false                   |
| fee_id            | integer    | null:false                   |
| prefecture_id     | integer    | null:false                   |
| delivery_days_id  | integer    | null:false                   |


## Association

- belongs_to :user
- has_one_attached :image
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :product_status
- belongs_to_active_hash :fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_days

## imagesテーブル
| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| image  | references | null:false, foreign_key:true |



## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressテーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| order           | references | null:false, foreign_key: true |
| postal_code     | string     | null:false                    |
| prefecture_id   | integer    | null:false                    |
| city            | string     | null:false                    |
| house_number    | string     | null:false                    |
| building_number | string     |                               |
| phone_number    | string     | null:false                    |

## Association

- belongs_to :order
- belongs_to_active_hash :prefecture
