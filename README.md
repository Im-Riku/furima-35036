# テーブル設計

## usersテーブル
| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| birthday    | date    | null: false |

### Association

- has_many  :items
- has_many  :comments

## itemsテーブル
| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| image           | ActiveStorage | null: false                    |
| item_name       | text          | null: false                    |
| explanation     | text          | null: false                    |
| category        | text          | null: false                    |
| condition       | text          | null: false                    |
| delivery_fee    | text          | null: false                    |
| delivery_source | text          | null: false                    |
| days_to_ship    | text          | null: false                    |
| price           | text          | null: false                    |
| user            | refrences     | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_many    :comments
- has_one     :purchases

## commentsテーブル
| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| text        | text      |                                |
| user        | refrences | null: false, foreign_key: true |
| item        | refrences | null: false, foreign_key: true |

### Association

- belongs_to  :users
- belongs_to  :items

## purchasesテーブル
| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| card_number    | text      | null: false                    |
| expiation_date | text      | null: false                    |
| security_code  | text      | null: false                    |
| item           | refrences | null: false, foreign_key: true |

### Association

- belongs_to  :items
- has_one     :addresses

## addressesテーブル
| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| postal_code     | text          | null: false                    |
| prefecture      | text          | null: false                    |
| municipalitie   | text          | null: false                    |
| buyer_address   | text          | null: false                    |
| building_name   | text          |                                |
| phone_number    | text          | null: false                    |

### Association

- belongs_to  :purchases
