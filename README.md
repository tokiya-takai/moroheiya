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
|       birthday      | string  | null: false |
|   black_favorite    | integer |             |
|   gold_favorite     | integer |             |
|   purple_favorite   | integer |             |
|    count_first      | integer |             |

### Associations

has_many :contests
has_many :works
has_one :favorite


## contests テーブル

|     Column      |    Type    |   Options                  |
| --------------- | ---------- | -------------------------- |
|      title      | string     | null: false                |
|    genre_id     | integer    | null: false                | ActiveHashを使用
|   category_id   | integer    | null: false                | ActiveHashを使用
|     content     | integer    | null: false                |
|     deadline    | string     | null: false                |
|      public     | boolean    | null: false, default: true |
|       user      | references | null: false                |

### Associations テーブル

has_many :works
belongs_to :user
has_one :first
has_one :second
has_one :third

## works テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|      title      | string     | null: false |
|     content     | string     | null: false |
|       user      | references | null: false |
|      contest    | references | null: false |

belongs_to :user
belongs_to :contest
has_one :favorite
has_one :first
has_one :second
has_one :third

## favorites テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
| black_favorite  | integer    |             |
| gold_favorite   | integer    |             |
| purple_favorite | integer    |             |
| normal_favorite | integer    |             |

### Association

belongs_to :user
belongs_to :work


## firsts テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Association

belongs_to :contest
belongs_to :work

## seconds テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Association

belongs_to :contest
belongs_to :work

## thirds テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Association

belongs_to :contest
belongs_to :work