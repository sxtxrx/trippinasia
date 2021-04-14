# README

#users table

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| name          | string  |null: false  |
| email             | string  |null: false ,unique: true|
| encrypted_password| string  |null: false  | 
|profile            | text   |null: false  | 
### Association
has_many :prototypes,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :prototype_likes, through: :likes, source: :prototype


#prototypes table
| Column            | Type          | Options      |
| --------          | ------        | -----------  | 
|title             | string        | null: false  |
|country            | integer       | null: false  |
|information        | text          | null: false  | 
|access          | text       | null:false|     
|user               | reference     |foreign key :true| 
### Association
belongs_to :country
belongs_to :user
has_many :comments,dependent: :destroy
has_one_attached :image
has_many :likes,dependent: :destroy
has_many :users, through: :likes



#comments table
| Column            | Type       | Options    |
| --------          | ------     | ---------- |
|prototype_id      | reference    |foreign key |
|user_id           |reference   |foreign key |
### Association
belongs_to :prototype
belongs_to :user



＃likes table
| Column         | Type      | Options     |
| --------       | ------    | ----------- |
|prototype_id      | reference    |foreign key |
|user_id           |reference   |foreign key |
### Association
belongs_to :user
belongs_to :prototype




 ## アプリの名前
 trippin'asia


##使用ライブラリ、フレーム

html&css
JavaScript
jQuery
Ruby
Ruby on Rails
MySqL
AWS

## 簡単な説明

アジアを旅行する人のための写真付き情報交換サイト


## 機能
- ユーザーログイン機能
- 写真閲覧異能
- 写真投稿機能
- コメント機能
- "いいね"機能

他の機能はこちらを参照して下さい。`awesome-tool --help`.

## 制作背景
海外を旅する人にとって何より大切なのは情報です。私がアジアを旅をしていた頃にsnsなどで情報収集してもユーザーの思い出写真や加工したものが多く、ブログでは情報収集に手間がかかるため簡単に見れる写真付きの情報交換用サイトが欲しいと思い制作しました。綺麗な写真だけではなく、ネガティブなものも含めての"情報"を発信して次に訪れる人の為により安全で楽しい旅行の手助けになればと思います。

## 使い方
新規登録をしてログインしてください。『post photo』から写真投稿ができます。
トップページから写真投稿の一覧が閲覧できます。画像クリックで写真詳細ページに遷移しコメント、いいねができます。
## github URL
https://github.com/sxtxrx/trippinasia.git


## 作者
satoru tomita

sxtxrxfor.pg@gmail.com


