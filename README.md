![トップページ.png](https://user-images.githubusercontent.com/57898864/137627388-4d89a472-e55b-4e69-854c-ae15ea9b9833.png)

# 制作背景
サービスの概要としては、複雑にならず必要とされるものだけを置いたシンプルな「勤怠管理アプリ」をイメージしたものです。
「人手不足で手が空いてる人に助っ人に来て欲しい」、「毎度連絡を入れるのが申し訳ない」、「常に掲示板的な物に仕事概要を載せって気軽に見れるようにできれば」などの要望があった為に少しでも改善できればと思い制作いたしました。
<br>
<br>

## URL

- URL: https://work-event.herokuapp.com
- ゲストログインボタンで簡単にログインできます。

<img width="730" alt="スクリーンショット 2021-10-18 7 43 00" src="https://user-images.githubusercontent.com/57898864/137700199-bc8e801c-5429-4534-b4b4-73b97cd753d4.png">
<br>
<br>
ログインボタンからでもゲストログインできます。

https://user-images.githubusercontent.com/57898864/137809299-dfffc21d-0907-4d37-a8ff-1b527a28972b.mov

<br>
<br>


<br>
<br>

## ER 図

<img width="728" alt="スクリーンショット 2021-10-18 17 52 54" src="https://user-images.githubusercontent.com/57898864/137699880-1250e4af-824f-4f84-9383-a38b62103215.png">
<br>
<br>
<br>

## 使用技術

- Rails 6.0.3.6
- Ruby 2.6.6
- JavaScript
- CSS
- Line_bot_api
- devise
- bootstrap 
- omniauth
- WEB サーバー : Heroku
- DB: PostgreSQL

<br>
<br>

## 機能一覧

|      | 　　　　　　 機能　 　　　　 　　 |
| :--- | :-------------------------------- |
| １   | アカウント登録機能 　             |
| ２   | アカウント削除機能 　             |
| ３   | ログイン機能 　　　　　　         |
| ４   | ゲストユーザーログイン機能 　　   |
| ５   | ログアウト機能　　　　　　　　    |
| ６   | アルバイトの検索機能 　（未）                   |
| ７   | アルバイトの追加機能(CRUD) 　             |
| ８   | 投稿内容更新機能(CRUD)            |
| ９   | 投稿内容削除機能(CRUD)            |
| １０ | コメント機能 　             |
| １１ | スタッフの詳細一覧機能 （未）　               |
| １２ | 日数管理機能　（未）   |
| １3 | マイページ機能                    |

<br>
<br>
<br>

# 何ができるのか

### 1. トップページ

<img width="1432" alt="スクリーンショット 2021-10-18 18 35 01" src="https://user-images.githubusercontent.com/57898864/137706396-8472cb6c-0d34-49b6-8631-719ddaadee1d.png">


- 最初にトップページへアクセスすると画面が描画されます。
- ログイン、ユーザー登録が配置
- ヘッダーのロゴ（助っ人マスター）を押すとトップページへリダイレクト。
  <br>
  <br>
  <br>

### 2. ユーザー認証

- アカウント登録済みの場合はフォームに Email と Password を入力してログイン。
- Lineアカウントをお持ちの方は「LINEでログイン」のボタンを押してログインが可能です。
  <br>
  <br>

https://user-images.githubusercontent.com/57898864/137810040-93ce0716-99bf-4457-852c-101aec963032.mov

<br>
<br>

```ruby

class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  protect_from_forgery except: [:callback]
  def line
    callback(:line)
  end

  def github
    callback(:github)
  end
.
.
.
end
```

  <br>
  <br>
  <br>

### 3. アルバイト（イベント）の追加

<img width="1432" alt="スクリーンショット 2021-10-18 18 44 17" src="https://user-images.githubusercontent.com/57898864/137708710-ee9bdc2e-3da7-4c77-b233-76d242be3a26.png">

- 投稿ボタンクリックで投稿ページ遷移
  <br>
  <br>
  <br>

<img width="1432" alt="スクリーンショット 2021-10-18 18 59 27" src="https://user-images.githubusercontent.com/57898864/137710450-7f503359-bad5-43f3-a913-b7f7e040db29.png">


- 仕事名・場所・曜日時刻・仕事内容
- 曜日時刻ではflatpickrを採用してますので、カレンダー表示で選択できます。
  <br>
  <br>
  <br>

<img width="1432" alt="スクリーンショット 2021-10-18 19 13 31" src="https://user-images.githubusercontent.com/57898864/137712696-e69dbc41-327c-4fd9-acb8-728148b19a14.png">


- LINE Message API を取得していますので、公式のLine_botを友達登録していれば、「送る」ボタンを押すと登録しているユーザーに通知が届くようになります。

<br>
<br>
<br>

![IMG_F55B578C6171-1](https://user-images.githubusercontent.com/57898864/137713238-04561828-36bb-441d-a3f8-b3c294cbd911.jpeg)


- 更新があると伝えてくれます。

<br>
<br>
<br>

### 4. 仕事一覧

- 投稿した内容は、他のユーザーが書き込めないようにログイン中の user_id と
created_by?メソッドを使用しアルバイトを作成したユーザーがアルバイト詳細ページを閲覧した時のみ編集・削除・送るボタンを表示するようにしています。<br>
- 削除ボタンを押すと、アラートでメッセージが表示され、OK ボタンを押すと削除されます。<br>

<img width="1432" alt="スクリーンショット 2021-10-18 19 24 11" src="https://user-images.githubusercontent.com/57898864/137713905-0df889fb-9a6b-4306-a0f1-6435d43bc03b.png">

<br>
<br>
<br>

### 5. レスポンシブ対応

https://user-images.githubusercontent.com/57898864/137810181-f9c7f4ef-2073-47f1-9d85-c4add4476d07.mov

- Bootstrap を使用してスマートフォンからでも使用可能
- デバイスによってハンバーガーメニューを実装
  <br>
  <br>
  <br>

### 6. 工夫したところ（実装面）

#### ① OAuthを利用して「LINEでログイン」機能を作る


```ruby

def callback(provider)
    @user = User.find_for_sns_oauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.persisted? # データベースに保存されていればログイン成功
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.upcase) if is_navigational_format?
    else # ログイン失敗
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
```

<br><br>

#### ② 非同期処理で参加コメント作成・キャンセル

https://user-images.githubusercontent.com/57898864/137810280-087a2265-6fcc-4d80-97d3-0ac540595ca5.mov

参加コメントを入力する際モーダルウィンドウが表示されるようになります。
```Ruby
<% if user_signed_in? == @ticket.nil? %>
      <button class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#createTicket">
        参加
      </button>
      <div class="modal fade" id="createTicket">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="dialogHeader">参加コメント</h4>
              <button class="close" type="button" data-dismiss="modal" &times;>
              </button>
              <!-- /.close -->
              <!-- /.modal-title -->
            </div>
            <!-- /.modal-header -->
            <%= form_with(model: @event.tickets.build, url: event_tickets_path(@event)) do |f| %>
              <div class="modal-body">
                <div id="createTicketErrors"></div>
                <%= f.text_field :comment, class:  "form-control" %>
              </div>
              <!-- /.modal-body -->
              <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                  キャンセル
                </button>
                <%= f.button "送信", class: "btn btn-primary" %>
              </div>
              <!-- /.modal-footer -->
            <% end %>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal fade -->
    <% else %>
      <%= link_to "キャンセル", event_ticket_path(@event), method: :delete, class: "btn btn-warning btn-lg btn-block" %>
    <% end %>
```

<br>
<br>

#### ③ゲストユーザーは、編集・削除できないように設定

<br>
<br>

- 下記のように設定し、誤って「更新」や「削除」をクリックしても、フラッシュメッセージが表示され、ホーム画面にリダイレクトされるようにしました。

```ruby
Rails.application.routes.draw do
  root 'homes#index'
  devise_for :user, controllers: {
    registrations: 'users/registrations'
  }
(略)
end
```

```ruby
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの更新・削除はできません。"
    end
  end
end

```



#### 7 今後実装したい内容

- 現在表示だけで、未実装なランキング形式での表示機能。<br>
- 場所選択時にGoogleMapとの連携で現在地までマップ表示できるように。<br>
- いろんなユーザーに使用してもらう為に、Room分けを取り付けたい。パスワードにて入室できるように。<br>
