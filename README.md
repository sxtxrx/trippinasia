# README





 ## アプリの名前
 -trippin'asia(URL:https://trippinasia.herokuapp.com/)

## 使用ライブラリ、フレーム

-html&css
-JavaScript
-jQuery
-Ruby
-Ruby on Rails
-MySqL
-AWS

## 簡単な説明

アジアを旅行する人のための写真付き情報交換サイト


## 機能
- ユーザーログイン機能
- 写真閲覧異能
- 写真投稿機能
- コメント機能
- "いいね"機能
- 今後ジャンルごとの表示機能を追加予定
## テスト用アカウント
- email: test@gmail.com
- password: 11111a


## 制作背景
海外を旅する人にとって何より大切なのは情報です。私がアジアを旅をしていた頃にsnsなどで情報収集してもユーザーの思い出写真や加工したものが多く、ブログでは情報収集に手間がかかるため簡単に見れる写真付きの情報交換用サイトが欲しいと思い制作しました。綺麗な写真だけではなく、ネガティブなものも含めての"情報"を発信して次に訪れる人の為により安全で楽しい旅行の手助けになればと思います。

## 使い方
右上の"sign_upの"から新規登録をしてログインしてください。
[![Image from Gyazo](https://i.gyazo.com/2252caefed28633b9a1546848eeb771f.jpg)](https://gyazo.com/2252caefed28633b9a1546848eeb771f)
[![Image from Gyazo](https://i.gyazo.com/63415143fa75527db68931e1d5c153c9.png)](https://gyazo.com/63415143fa75527db68931e1d5c153c9)
ログイン後『post photo』から写真投稿ができます。
[![Image from Gyazo](https://i.gyazo.com/5cd93c9bd893a86e542fbd84092ab0f2.png)](https://gyazo.com/5cd93c9bd893a86e542fbd84092ab0f2)
トップページから写真投稿の一覧が閲覧できます。
[![Image from Gyazo](https://i.gyazo.com/9685b508b17cd1835ff05ff2a3fe360f.jpg)](https://gyazo.com/9685b508b17cd1835ff05ff2a3fe360f)
画像クリックで写真詳細ページに遷移しコメント、いいねができます。
[![Image from Gyazo](https://i.gyazo.com/ddf99637142d560f968336e601a5a176.png)](https://gyazo.com/ddf99637142d560f968336e601a5a176)
## github URL
https://github.com/sxtxrx/trippinasia.git


## 作者
satoru tomita

sxtxrxfor.pg@gmail.com

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


