# データベース設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

## items テーブル

| Column                  | Type     | Options     |
| ----------------------- | -------- | ----------- |
| name                    | string   | null: false, limit: 40 |
| description             | text     | null: false, limit: 1000 |
| status_id               | integer  | null: false |
| detail_id               | integer  | null: false |
| delivery_fee_id         | integer  | null: false |
| prefecture_id           | integer  | null: false |
| shipping_days_id        | integer  | null: false |
| price                   | integer  | null: false, 300..9_999_999 |
| user_id                 | bigint   | FK（users.id） |
| created_at / updated_at | datetime | Rails標準 |

## item_images テーブル

| Column             | Type   | Options       |
| ------------------ | ------ | ------------- |
| id                 | bigint | PK            |
| item_id            | bigint | FK（items.id） |
| image_url          | string | null: false   |

## purchases テーブル

| Column                  | Type       | Options       |
| ----------------------- | ---------- | ------------- |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |
| created_at / updated_at | datetime   | Rails標準      |

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