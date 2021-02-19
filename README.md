ご覧いただきありがとうございます。

テストユーザー<br />
email : test@test.com<br />
pass  : test123<br />
<br />
アプリケーションの概要<br />
個人が自由にコンテストを開催し参加者を募ることで、趣味の共有・向上を図ることができます。<br />

URL  
https://moroheiya.herokuapp.com/  
<br />
アプリケーション機能一覧<br />
- deviseを使ったユーザー認証機能
- コンテスト開催機能
- コンテスト応募機能（作品投稿機能）
- いいね機能
- 3種類の有料いいね機能
- 有料いいね購入機能
- いいね数によるランキング機能
- ランキング上位にメダル付与機能
- ページネーション機能
- ActiveStorage
- Heroku
- MySQL2
- clockworkを使った定期バッチ処理
- AWS S3
<br />
使用言語、フレームワークおよびDB<br />
- Ruby 2.6.5
- Rails 6.0.0
- HTML
- CSS,SCSS
- JavaScript
- jQuery
- MySQL2
<br />
アプリケーションの使い方 :<br />
アカウントを持っていない場合<br />
- コンテストとその作品を閲覧することができます。<br />
<br />
アカウントを持っている場合<br />
- コンテストを開催できます。ヘッダー内「はじめる」ボタンから遷移し、コンテストを開催するを選択します。
- 作品を投稿できます。参加したいコンテストを一覧もしくは検索から探し、コンテスト詳細画面から参加するを選択します。
なお、自分で開催したコンテストに投稿することも可能です。  
- 作品にいいねを付けることができます。４種類のいいねがあり、１つの作品につき全てのいいねを１種類ずつ付けることができます。
=> いいねにはランクがあり、ブラック(20)、ゴールド(10)、パープル(5)、ノーマルがあります。(カッコの数字はノーマルn個分という意味です。)<br />
=> コンテストには締め切りが設けられており、それを過ぎると投稿やいいねの付与はできなくなり、いいね順に作品が表示されます。<br />
=> 上位3作品にはそれぞれメダルが付与されます。獲得したメダルはユーザーの詳細画面で誰からでも確認できます。また、１位になった作者には、名前の横にその印が付与されます。<br />
- 有料いいねを購入することができます。
=> ユーザー詳細画面から、カードの登録を行ったあと、いいねを購入するボタンから購入できます。<br />
=> 自分が今持っているいいねの数は、ユーザー詳細画面で確認できます。この情報は他者には公開されません。<br />
=> 自分が持っているだけの数を作品に付与することができます。<br />

目指した課題解決<br />
- 駆け出しイラストレーターなど、技術が必要な趣味や仕事をはじめた人の客観的評価がTwitterなどのSNSではフォロワー数などに影響されるため、すぐにはわからないという課題。
ペルソナ1<br />
基本情報 : 18歳女性<br />
ユーザストーリー : 趣味でイラストを描いている。Twitterでイラストの発信をしてはいるものの、フォロワー数も少なく自分の絵の客観的な評価がわかりにくいと感じている。
それなりに自信があるため、仕事としてはじめたいと思ってはいるが、知名度と実績がなく、これらを得たいと考えている。<br />

アプリケーションのクローン<br />

```
git clone https://github.com/tokiya-takai/moroheiya

bundle install

yarn install

rails db:create db:migrate
```

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

has_many :contests<br />
has_many :works<br />
has_many :normals<br />
has_many :orders<br />


## contests テーブル

|     Column      |    Type    |   Options                  |
| --------------- | ---------- | -------------------------- |
|      title      | string     | null: false                |
|    genre_id     | integer    | null: false                |
|   category_id   | integer    | null: false                |
|     content     | text       | null: false                |
|     deadline    | date       | null: false                |
|      general     | boolean    | null: false, default: true |
|       user      | references | null: false                |
|    works_count  | integer    | null: false                |
|       end       | boolean    | null: false, default:false |

### Associations

belongs_to :user<br />
has_many :works<br />
has_one :first<br />
has_one :second<br />
has_one :third<br />

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

belongs_to :user<br />
belongs_to :contest<br />
has_many :blacks<br />
has_many :golds<br />
has_many :purples<br />
has_many :normals<br />
has_one :first<br />
has_one :second<br />
has_one :third<br />

## normals テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user<br />
belongs_to :work<br />

## purples テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user<br />
belongs_to :work<br />


## golds テーブル

|     Column      |    Type    |   Options   |
| --------------- | ---------- | ----------- |
|    user_id      | integer    |             |
|    work_id      | integer    |             |


### Associations

belongs_to :user<br />
belongs_to :work<br />


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
