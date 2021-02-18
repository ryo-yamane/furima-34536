# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| nickname           | string     | null: false |
| first_name(漢字)    | string     | null: false |
| last_name (漢字)    | string     | null: false |
| first_name（カナ)   | string     | null: false |
| last_name（カナ)    | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| birthday           | date       | null: false |


### Association
has_many :products
has_many :purchase
has_many :ordered


##  productsテーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| product_name     | string        | null: false |
| product_explain  | text          | null: false |
| price            | integer       | null: false |
| category         | string        | null: false |
| brand            | string        | null: false |
| condition_id     | string        | null: false |
| consignor_area_id| string        | null: false |
| deliver_fee_id   | string        | null: false |
| prepare_date_id  | datetime      | null: false |
| user             | references    |null: false, foreign_key: true|


### Association
belongs_to :user
has_one :ordered
has_one :purchase



## purchase テーブル

| Column                        | Type       | Options      |
| ----------------------------- | ---------- | ------------ |
| post_code                     | string     | null: false  |
| prefecture_id                 | string     | null: false  |
| city                          | string     | null: false  |
| town                          | string     | null: false  |
| number                        | string     | null: false  |
| building_name                 | string     |              |
| phone_number                  | integer    | null: false  |
| user                          | reference  |null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :product



## ordered テーブル

| Column                        | Type       | Options                      |
| ----------------------------- | ---------- | ---------------------------- |
| user_id                       | reference  |null: false, foreign_key: true|
| product_id                    | reference  |null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :product