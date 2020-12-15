 テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_kana          | string  | null: false |
| first_kana         | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| birthday           | string  | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| description     | text       | null: false       |
| price           | integer    | null: false       |
| category_id     | integer    | null: false       |
| condition_id    | integer    | null: false       |
| postage_id      | integer    | null: false       |
| prefecture_id   | integer    | null: false       |
| days_to_ship_id | integer    | null: false       |
| user            | references | foreign_key: true |

## Active Hash
- category
- condition
- postage
- prefecture
- days_to_ship

### Association

- belongs_to :user
- has_one    :order

##  ordersテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

##  addressesテーブル

| Column         | Type       | Options           |
| -------------  | ---------- | ------------------|
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| city           | string     | null: false       |
| address_line_1 | string     | null: false       |
| address_line_2 | string     |                   |
| tel            | string     | null: false       |
| order          | references | foreign_key: true |


## Active Hash
- prefecture

### Association
- belongs_to :order
