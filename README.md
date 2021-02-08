## usersテーブル

| Column             | Type    | Options                   |
| ----------         | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buys


## itemsテーブル

| Column          | Type       | Options           |
| ----------      | ------     | ----------------- |
| name            | string     | null: false       |
| description     | text       | null: false       |
| category_id     | integer    | null: false       |
| state_id        | integer    | null: false       |
| fee_id          | integer    | null: false       |
| from_id         | integer    | null: false       |
| day_id          | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## addressesテーブル

| Column        | Type       | Options           |
| ----------    | ------     | ----------------- |
| postal_code   | string     | null: false       |
| from_id       | integer    | null: false       |
| municipality  | string     | null: false       |
| house_number  | string     | null: false       |
| building_name | string     |                   |
| tell          | string     | null: false       |
| buy           | references | foreign_key: true |

### Association

- belongs_to :buy


## buysテーブル

| Column          | Type       | Options           |
| ----------      | ------     | ----------------- |
| item            | references | foreign_key: true |
| user            | references | foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item