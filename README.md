# テーブル設計

## usersテーブル
| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name_kanji     | string  | null: false               |
| first_name_kanji    | string  | null: false               |
| last_name_katakana  | string  | null: false               |
| first_name_katakana | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many  :items
- has_many  :comments
- has_many  :purchases

## itemsテーブル
| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item_name          | string        | null: false                    |
| explanation        | text          | null: false                    |
| category_id        | integer       | null: false                    |
| condition_id       | integer       | null: false                    |
| delivery_fee_id    | integer       | null: false                    |
| delivery_source_id | integer       | null: false                    |
| days_to_ship_id    | integer       | null: false                    |
| price              | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_many    :comments
- has_one     :purchase

## commentsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       |                                |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item

## purchasesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item
- has_one     :addresse

## addressesテーブル
| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| postal_code     | string        | null: false                    |
| prefecture      | integer       | null: false                    |
| municipalitie   | string        | null: false                    |
| buyer_address   | string        | null: false                    |
| building_name   | string        |                                |
| phone_number    | string        | null: false                    |
| purchase        | references    | null: false, foreign_key: true |

### Association

- belongs_to  :purchase
