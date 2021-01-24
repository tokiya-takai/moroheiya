# テーブル設計

## users テーブル

|       Column        |  Type   |   Options   |
| ------------------- | ------- | ----------- |
|       nickname      | string  | null: false |
|         email       | string  | null: false |
|  encrypted_password | string  | null: false |
|      family_name    | string  | null: false |
|      first_name     | string  | null: false |
|   family_name_kana  | string  | null: false |
|   first_name_kana   | string  | null: false |
|     postal_code     | string  | null: false |
|    prefecture_id    | integer | null: false |
|     municipality    | string  | null: false |
|       address       | string  | null: false |
|       building      | string  |             |
|     phone_number    | string  | null: false |
|      black_iine     | integer |             |
|      gold_iine      | integer |             |
|     purple_iine     | integer |             |

### Associations

has_many :contests
has_many :works


## contests テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|      title      | string     | null: false |
|    genre_id     | integer    | null: false |
|   category_id   | integer    | null: false |
|     content     | integer    | null: false |
|     deadline    | string     | null: false |
|       user      | references | null: false |

### Associations テーブル

has_many :works
belongs_to :user

## works テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|      title      | string     | null: false |
|     content     | string     | null: false |
|    black_iine   | integer    |             |
|    gold_iine    | integer    |             |
|    purple_iine  | integer    |             |
|    normal_iine  | integer    |             |
|       user      | references | null: false |
|      contest    | references | null: false |

belongs_to :user
belongs_to :contest