 テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kana          | string | null: false |
| first_kana         | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birthday           | string | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| description     | text       | null: false       |
| price           | integer    | null: false       |
| category_id     | integer    | null: false       |
| condition_id    | integer    | null: false       |
| ship_from_id    | integer    | null: false       |
| days_to_ship_id | integer    | null: false       |
| user            | references | foreign_key: true |

## Active Hash
- category
- condition
- ship_from
- days_to_ship

### Association

- belongs_to :user
- has_one    :purchase

##  purchasesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :adress

##  adressesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ------------------|
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| adress_line_1 | string     | null: false       |
| adress_line_2 | string     |                   |
| tel           | string     | null: false       |
| purchase      | references | null: false       |


## Active Hash
- prefecture

### Association
- belongs_to :purchase
