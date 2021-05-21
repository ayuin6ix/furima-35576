# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| familynamekanji    | string              | null: false             |
| firstnamekanji     | string              | null: false             |
| familynamekana     | string              | null: false             |
| firstnamekana      | string              | null: false             |
| birthday           | integer             | null: false             |

### Association

* has_many :items
* 

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| category                            | string     | null: false       |
| description                         | text       | null: false       |
| price                               | integer    | null: false       |
| status                              | string     | null: false       |
| shipping_cost                       | integer    | null: false       |
| shipping_days                       | integer    | null: false       |
| user_id                             | string     | null: false       |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user_id     | string     | null: false       |
| item_id     | string     | null: false       |


### Association

- belongs_to :user
- belongs_to :item

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| post_code          | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | text                |                         |
| phone_number       | integer             | null: false             |


### Association

- has_one :order
- 
