# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
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
| prefecture                          | string     | null: false       |
| shipping_cost_id                       | integer    | null: false       |
| shipping_days_id                       | integer    | null: false       |
| user_id                             | reference     | null: false       |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user_id     | reference     | null: false       |
| item_id     | reference     | null: false       |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| post_code          | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string                |                         |
| phone_number       | integer             | null: false             |


### Association

- has_one :order
- 
