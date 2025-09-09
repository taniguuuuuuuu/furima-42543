# データベース設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| id                 | bigint   | PK, auto_increment |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday           | date     | null: false |
| created_at         | datetime | null: false, default: CURRENT_TIMESTAMP |
| updated_at         | datetime | null: false, default: CURRENT_TIMESTAMP |

has_many :items
has_many :purchases

## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| name                    | string     | null: false, limit: 40 |
| description             | text       | null: false, limit: 1000 |
| status_id               | integer    | null: false |
| detail_id               | integer    | null: false |
| delivery_fee_id         | integer    | null: false |
| prefecture_id           | integer    | null: false |
| shipping_day_id         | integer    | null: false |
| price                   | integer    | null: false, 300..9_999_999 |
| user_id                 | references | FK（users.id） |

belongs_to :user
has_one :purchase

## purchases テーブル

| Column                  | Type       | Options       |
| ----------------------- | ---------- | ------------- |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |
| created_at / updated_at | datetime   | Rails標準      |

belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| street        | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
| purchase      | references | null: false, foreign_key: true |

belongs_to :purchas