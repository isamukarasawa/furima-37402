

## users_テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false, unique:true |
| encrypted_password | string     | null: false              |
| last_name          | string     | null: false              |
| first_name         | string     | null: false              |
| last_name_kana     | string     | null: false              |
| first_name_kane    | string     | null: false              |
| birthday           | date       | null: false              |

### Association
- has_many :items
- has_many :purchases

## items_テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| product_name         | string      | null: false                    |
| expianation          | text        | null: false                    |
| category_id          | integer     | null: false                    |
| product_situation_id | integer     | null: false                    |
| delivery_charge_id   | integer     | null: false                    |
| prefecturse_id       | integer     | null: false                    |
| delivery_day_id      | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## addresses_テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    | 
| prefecturse_id       | integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| biru_name            | string     |                                |
| tel                  | string     | null: false                    |
| purchase             | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## purchases_テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
