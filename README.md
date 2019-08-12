# README
---
### followermap

## 概要
---
### ツイッターのアカウントでログインすると、フォローしてくれている人の所在地情報を集計して、地図上にマーカーをプロットしてくれるアプリです。

## コンセプト

### 行動データ　×　地図を使ったビジュアライゼーション　は見ているだけで楽しいと思ったので、手軽にtwitterのフォロワーを地図状で可視化できるサービスがあったら使ってみたくなる気がして開発しました。

## バージョン情報
---
### Ruby 2.6.3 Rails 5.2.3

## 機能一覧
---
- twitterでのソーシャルログイン機能
- twitterアカウントのフォロワーのプロフィール欄の「場所」を取得して、google mapにマーカーを立てる機能
- 管理者のブログ投稿機能
- 管理者のブログ編集機能
- 管理者のブログ削除機能


## カタログ設計
---
https://docs.google.com/spreadsheets/d/1SNVcb7wU6HBrRpULJGyGUeBiDx9o5mxzRo3UR4ZWqSU/edit?usp=sharing

## テーブル定義書
---
https://docs.google.com/spreadsheets/d/1TcGj0h4dau9pqnIx_WD1ezbP4FcybslysBoKmXLTK5k/edit?usp=sharing

## ER図
---
https://docs.google.com/spreadsheets/d/19clJOfu8vca1i0H5mUxKwbH7t7zwid4y0s4dA18voz0/edit?usp=sharing

## 画面遷移図
---
https://docs.google.com/spreadsheets/d/13mi5EaeVJh91h56VvCDEzLU5biZXrrLxC6qBaefdUio/edit?usp=sharing

## ワイヤーフレーム
---
https://docs.google.com/spreadsheets/d/1xJJ9ENXq5oNeWnaqX5WvvXILUuxOw-yE5EpeIOumobg/edit?usp=sharing

## 使用予定Gem
---
- devise
- omniauth-twitter
- twitter
- geocoder
