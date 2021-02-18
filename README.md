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
| password           | string     | null: false |
| birthday           | datetime   | null: false |
| phone_number       | integer    | null: false |

### Association
has_many :products
has_one  :purchaser


##  productsテーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| product_name     | string        | null: false |
| product_explain  | text          | null: false |
| price            | integer       | null: false |
| category         | string        | null: false |
| brand            | string        | null: false |
| condition        | string        | null: false |
| how_to_delivery  | string        | null: false |
| consignor_area   | string        | null: false |
| deliver_fee      | string        | null: false |
| prepare_date     | datetime      | null: false |
| user             | references    |             |


### Association
belongs_to :user


## purchaser テーブル

| Column                        | Type       | Options      |
| ----------------------------- | ---------- | ------------ |
| number_of_credit_card         | integer    | null: false  |
| limit_date_of_credit_card     | integer    | null: false  |
| security_code_of_credit_card  | integer    | null: false  |
| post_code                     | integer    | null: false  |
| prefecture                    | string     | null: false  |
| city                          | string     | null: false  |
| town                          | string     | null: false  |
| number                        | string     | null: false  |
| building_name                 | string     | null: false  |
| user                          | reference  | null: false  |


### Association
belongs_to :user

