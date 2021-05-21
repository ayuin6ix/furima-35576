# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false  unique: true            |
| encrypted_password           | string              | null: false             |
| family_name_kanji    | string              | null: false             |
| first_name_kanji     | string              | null: false             |
| family_name_kana     | string              | null: false             |
| first_name_kana      | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| category_id                            | integer     | null: false       |
| description                         | text       | null: false       |
| price                               | integer    | null: false       |
| status_id                              | integer     | null: false       |
| prefecture_id                          | integer     | null: false       |
| shipping_cost_id                       | integer    | null: false       |
| shipping_day_id                       | integer    | null: false       |
| user                             | reference     | null: false  foreign_key: true     |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user     | reference     | null: false  foreign_key: true     |
| item     | reference     | null: false   foreign_key: true    |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| post_code          | string              | null: false             |
| prefecture_id         | integer             | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string                |                         |
| phone_number       | integer             | null: false             |
| order              | reference           | foreign_key: true       |


### Association

- 
- belongs_to :order
