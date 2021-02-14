アプリケーションの概要
個人が自由にコンテストを開催し参加者を募ることで、趣味の共有・向上を図ることができます。

アプリケーション機能一覧
・deviseユーザー認証機能
・コンテスト開催機能
・コンテスト応募機能（作品投稿機能）
・いいね機能
・3種類の有料いいね機能
・有料いいね購入機能
・ページネーション機能
・ActiveStorage
・Heroku
・MySQL2

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
|      public     | boolean    | null: false, default: true |
|       user      | references | null: false                |
|    works_count  | integer    | null: false                | counter_cultureを使用

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

belongs_to :user
belongs_to :contest
has_many :blacks
has_many :golds
has_many :purples
has_many :normals
has_one :first
has_one :second
has_one :third

## normal テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work

## purple テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## gold テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## black テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user
belongs_to :work


## firsts テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Associations

belongs_to :contest
belongs_to :work

## seconds テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Associations

belongs_to :contest
belongs_to :work

## thirds テーブル

|  Column   |   Type    |   Options   |
| --------- | --------- | ----------- |
|  contest  | integer   | uniquness   |
|    work   | integer   | uniquness   |(2カラムによる一意性.validatesにて担保)

### Associations

belongs_to :contest
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
