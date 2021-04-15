## DB設計

## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| email              | string              | null: false, unique: true  |
| encrypted_password | string              | null: false                |
| name               | string              | null: false                |
| nickname           | string              | null: false                |
| name_reading       | string              | null: false                |

### Association

* has_many :items
* has_many :addresses

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| catch_copy                          | text       | null: false       |
| concept                             | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |

### Association

- belongs_to :items
- belongs_to :user