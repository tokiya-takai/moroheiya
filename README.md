アプリケーションの概要
個人が自由にコンテストを開催し参加者を募ることで、趣味の共有・向上を図ることができます。

アプリケーション機能一覧
・deviseユーザー認証機能
・コンテスト開催機能
・コンテスト応募機能（作品投稿機能）
・いいね機能
・3種類の有料いいね機能
・有料いいね購入機能
・いいね数によるランキング機能
・ランキング上位にメダル付与機能
・ページネーション機能
・ActiveStorage
・Heroku
・MySQL2
・clockworkを使った定期バッチ処理
・AWS S3

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
|      profile        | integer |             |
|   black_favorite    | integer |             |
|   gold_favorite     | integer |             |
|   purple_favorite   | integer |             |
|    count_first      | integer |             |
|    count_second     | integer |             |
|    count_third      | integer |             |

### Associations

has_many :contests
has_many :works
has_many :normals
has_many :orders


## contests テーブル

|     Column      |    Type    |   Options                  |
| --------------- | ---------- | -------------------------- |
|      title      | string     | null: false                |
|    genre_id     | integer    | null: false                | ActiveHashを使用
|   category_id   | integer    | null: false                | ActiveHashを使用
|     content     | text       | null: false                |
|     deadline    | date       | null: false                |
|      general     | boolean    | null: false, default: true |
|       user      | references | null: false                |
|    works_count  | integer    | null: false                | counter_cultureを使用
|       end       | boolean    | null: false, default:false |

### Associations

belongs_to :user
has_many :works
has_one :first
has_one :second
has_one :third

## works テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|      title      | string     | null: false |
|     content     | text       | null: false |
|       user      | references | null: false |
|      contest    | references | null: false |
|   blacks_count  | integer    |             |
|   golds_count   | integer    |             |
|   purples_count | integer    |             |
|   normals_count | integer    |             |
|    total_count  | integer    |             |

belongs_to :user
belongs_to :contest
has_many :blacks
has_many :golds
has_many :purples
has_many :normals
has_one :first
has_one :second
has_one :third

## normals テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work

## purples テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## golds テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## blacks テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## orders テーブル

|  Column   |     Type     |   Options           |
| --------- | ------------ | ------------------- |
|    user   | references   | foreign_key: true   |
|    black  | integer      |                     |
|    gold   | integer      |                     |
|   purple  | integer      |                     |

### Association

belongs_to :user
