## DB設計

## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| email              | string              | null: false, unique: true  |
| encrypted_password | string              | null: false                |
| nickname           | string              | null: false                |
| birthday           | date                | null: false                |
| last_name          | string              | null: false                |
| first_name         | string              | null: false                |
| last_name_kana     | string              | null: false                |
| first_name_kana    | string              | null: false                |


### Association

* has_many :items
* has_many :products

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product_name                        | string     | null: false       |
| product_description                 | text       | null: false       |
| product_price                       | integer    | null: false       |
| product_condition_id                | integer    | null: false       |
| shipping_charge_id                  | integer    | null: false       |
| shipping_area_id                    | integer    | null: false       |
| days_ship_id                        | integer    | null: false       |
| category_id                         | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :product

## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| product             | references | foreign_key: true              |

### Association

- belongs_to :product

## products table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | foreign_key: true              |
| item          | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresse


