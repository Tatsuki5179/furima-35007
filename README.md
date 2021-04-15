## DB設計

## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| email              | string              | null: false, unique: true  |
| encrypted_password | string              | null: false                |
| name               | string              | null: false                |
| nickname           | string              | null: false                |
| name_reading       | string              | null: false                |
| bithday            | string              | null: false                |
| last_name          | string              | null: false                |
| first_name         | string              | null: false                |
| last_name_kana     | string              | null: false                |
| first_name_kana    | string              | null: false                |


### Association

* has_many :items
* has_many :addresses

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product_name                        | string     | null: false       |
| product_description                 | text       | null: false       |
| product_price                       | text       | null: false       |
| product_condition                   | text       | null: false       |
| shipping_charges                    | text       | null: false       |
| shipping_area                       | text       | null: false       |
| days_ship                           | date       | null: false       |
| category                            | text       | null: false       |

### Association

- belongs_to :user
- has_many :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | user_id, foreign_key: true     |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :items
- belongs_to :user