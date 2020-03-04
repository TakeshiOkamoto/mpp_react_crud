# Rails + React + AjaxでCRUDのサンプルプロジェクト
  
DEMO    
[https://www.petitmonte.com/rails-demo/react_crud](https://www.petitmonte.com/rails-demo/react_crud)  
  
詳細な解説  
只今、作成中です。   
    
## 1. 環境
・Ruby 2.6.5  
・Rails 6.0.2 (2019/12/18版)  
・React 16.13.0  
・MariaDB 10.2.2以上 (MySQL5.5以上でも可)  
 
## 2. インストール方法
  
### bundle  
```rb
bundle install 
```
  
### 各種パッケージのインストール  
node_modulesフォルダ及びyarn.lockファイルを削除していますので次のコマンドでインストールします。  
```rb  
yarn install 
```
  
### database.yml  
config/database.ymlでデータベース設定を行います。  
  

### データベース系のコマンド  
```rb

// 各データベースの作成
bin/rails db:migrate

// 各テーブルの初期データの作成
bin/rails db:seed
```
  
### マスタキーの生成 
・/config/master.key  
・/config/credentials.yml.enc  
は削除しています。次のコマンドで再生成します。  
```rb
EDITOR=vi bin/rails credentials:edit   
```  
ファイル生成後、credentials.yml.encの編集画面が表示されるので:q!で終了します。

development.rb/production.rbの両方に  
```rb
config.require_master_key = true  
``` 
を定義しているのでマスタキーの生成は必須です。   
  
### フォルダの生成
```rb  
app/assetsにimagesフォルダを手動で生成する。 
```
※コレを行わないと「Completed 500 Internal Server Error」になりますのでご注意。  
    
## 3. Rails6プロジェクトの各種初期設定
その他は次の記事を参照してください。  
  
[Rails6プロジェクトの各種初期設定](https://www.petitmonte.com/ruby/rails6_project.html)  
