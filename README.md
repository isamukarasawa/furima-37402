

## users_テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| e-mail          | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kane | string     | null: false |
| birth_day       | string     | null: false |
| introduction    | string     | null: false |

### Association
- has_many :items
- has_many :purchases

## items_テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| product_name      | string     | null: false |
| expianation       | string     | null: false |
| category          | string     | null: false |
| product_situation | string     | null: false |
| delivery_charge   | string     | null: false |
| delivery_area     | string     | null: false |
| delivery_days     | string     | null: false |
| price             | string     | null: false |
| commission        | string     | null: false |
| profit            | string     | null: false |

### Association
- belongs_to :user
- belongs_to :buyer
- has_one :purchase

## buyer_テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| last_name         | string     | null: false                    |
| first_name        | string     | null: false                    |
| post_code         | string     | null: false                    | 
| prefecturses      | string     | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| biru_name         | string     | null: false                    |
| tel               | string     | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association
- has_many :items
- has_one :purchase

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| buyer_id          | references | null: false, foreign_key: true |
| user_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_one :buyer
