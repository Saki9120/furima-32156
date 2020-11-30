 テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_kana  | string | null: false |
| first_kana | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| name         | string     | null: false       |
| description  | text       | null: false       |
| price        | integer    | null: false       |
| category     | integer    | null: false       |
| condition    | integer    | null: false       |
| ship_from    | integer    | null: false       |
| days_to_ship | integer    | null: false       |
| user         | references | foreign_key: true |

## Active Hash
- category
- condition
- ship_from
- days_to_ship

### Association

- belongs_to :user
- has_one    :purchase

##  purchasesテーブル

| Column        | Type       | Options
| ------------- | ---------- | ------------------|
| card_num      | integer    | null: false       |
| varid_thru    | integer    | null: false       |
| security_code | integer    | null: false       |
| prefecture    | integer    | null: false       |
| city          | text       | null: false       |
| adress_line_1 | text       | null: false       |
| adress_line_2 | text       | null: false       |
| tel           | integer    | null: false       |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

## Active Hash
- prefecture

### Association

- belongs_to :user
- belongs_to :item
