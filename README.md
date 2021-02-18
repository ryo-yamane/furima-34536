# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| nickname           | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_kana    | string     | null: false |
| last_name_kana     | string     | null: false |
| email              | string     | null: false , unique: true|
| encrypted_password | string     | null: false |
| birthday           | date       | null: false |


### Association
has_many :products
has_many :orders


##  productsテーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| product_name     | string        | null: false |
| product_explain  | text          | null: false |
| price            | integer       | null: false |
| category_id      | integer       | null: false |
| condition_id     | integer        | null: false |
| consignor_area_id| integer       | null: false |
| deliver_fee_id   | integer       | null: false |
| prepare_date_id  | integer       | null: false |
| user             | references    |null: false, foreign_key: true|


### Association
belongs_to :user
has_one :order



## purchases テーブル

| Column                        | Type       | Options      |
| ----------------------------- | ---------- | ------------ |
| post_code                     | string     | null: false  |
| consignor_area_id             | reference  | null: false  |
| city_town                     | string     | null: false  |
| number                        | string     | null: false  |
| building_name                 | string     |              |
| phone_number                  | string     | null: false  |
| order                         | reference  |null: false, foreign_key: true |


### Association
belongs_to :order




## orders テーブル

| Column                        | Type       | Options                      |
| ----------------------------- | ---------- | ---------------------------- |
| user                          | reference  |null: false, foreign_key: true|
| product                       | reference  |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :product
has_one :purchase