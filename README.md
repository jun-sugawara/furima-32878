## usersテーブル

| Column          | Type    | Options     |
| ----------      | ------  | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :buys


## itemsテーブル

| Column          | Type       | Options     |
| ----------      | ------     | ----------- |
| name            | string     | null: false |
| description     | text       | null: false |
| state           | string     | null: false |
| fee             | string     | null: false |
| from            | string     | null: false |
| days            | integer    | null: false |
| price           | integer    | null: false |
| user            | references |             |

### Association

- belongs_to :user
- belongs_to :address


## addressesテーブル

| Column        | Type       | Options     |
| ----------    | ------     | ----------- |
| postal_code   | integer    | null: false |
| prefectures   | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| tell          | integer    | null: false |
| item          | references |             |

### Association

- belongs_to :item
- belongs_to :buys


## buysテーブル

| Column          | Type       | Options     |
| ----------      | ------     | ----------- |
| item            | references |             |
| user            | references |             |

### Association

- has_one :address
- belongs_to :user