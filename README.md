![トップページ.jpg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/1b7f1a91-49c0-c6a5-4656-5b181e27a81f.jpeg)

# 制作背景
サービスの概要としては、複雑にならず必要とされるものだけを置いたシンプルな「勤怠管理アプリ」をイメージしたものです。
「人手不足で手が空いてる人に助っ人に来て欲しい」、「毎度連絡を入れるのが申し訳ない」、「常に掲示板的な物に仕事概要を載せって気軽に見れるようにできれば」などの要望があった為に少しでも改善できればと思い制作いたしました。
<br>
<br>

## URL

- URL: https://shalibo.netlify.app
- ゲストログインボタンで簡単にログインできます。

![スクリーンショット 2021-07-04 11.44.48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/6bfe5771-ce2b-5101-44f7-84b12006e42a.png)

Qiita に詳細を執筆しております。
[Vue.js、FireBase で読書管理アプリを作ってみた](https://qiita.com/oga0927/items/abf48b692b11fec6ae36)
<br>
<br>

## ER 図

![Untitled Diagram (1).png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/646313e3-2a27-62f9-7063-3b13a03757d1.png)
<br>
<br>
<br>

## インフラ構成図

![インフラ構成図.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/cb5c036e-398e-7e77-22f4-296a0b16c2da.png)
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
| ６   | アルバイトの検索機能 　                   |
| ７   | アルバイトの追加機能(CRUD) 　             |
| ８   | 投稿内容更新機能(CRUD)            |
| ９   | 投稿内容削除機能(CRUD)            |
| １０ | コメント機能(Ajax) 　             |
| １１ | スタッフの詳細一覧機能 　               |
| １２ | ランキングページ   |
| １3 | マイページ機能                    |

<br>
<br>
<br>

# 何ができるのか

### 1. トップページ

![スクリーンショット 2021-07-04 16.09.57.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/1148695b-8c81-4c71-1049-bc5f72432d63.png)

- 最初にトップページへアクセスすると画面が描画されます。
- ログイン、ユーザー登録が配置
- ヘッダーのロゴ（SHALIBO）を押すとトップページへリダイレクト。
  <br>
  <br>
  <br>

### 2. ユーザー認証

- アカウント登録済みの場合はフォームに Email と Password を入力してログイン。
- Lineアカウントをお持ちの方は「LINEでログイン」のボタンを押してログインが可能です。
  <br>
  <br>

![ログイン.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/65ac92af-c074-c383-fccf-460f8a699eed.gif)
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

### 3. ユーザー登録

![ユーザー登録.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/5431fcf3-66bd-4d54-5695-d90555c509e5.gif)
- UserName、Email、Password を入力して登録。<br>
- (ユーザーネームを入力しない場合はゲストログイン名として表示されます)
  <br>
  <br>
  <br>

### 4. 本の投稿

![スクリーンショット 2021-07-04 19.44.09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/7a361f0d-26fa-f01c-88d8-68364a1482f1.png)

- 投稿ボタンクリックで投稿ページ遷移
  <br>
  <br>
  <br>

![スクリーンショット 2021-07-04 19.48.16.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/eff56f42-42a4-2f55-db28-ac278b2f8898.png)

- 仕事名・場所・曜日時刻・仕事内容
- 曜日時刻ではflatpickrを採用してますので、カレンダー表示で選択できます。
  <br>
  <br>
  <br>

![スクリーンショット 2021-07-04 20.08.49.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/4512394a-0343-22cd-58ee-ce93c90a2ede.png)


- LINE Message API を取得していますので、公式のLine_botを友達登録していれば、「送る」ボタンを押すと登録しているユーザーに通知が届くようになります。

<br>
<br>
<br>

![質問内容.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/9b5eb1c0-81fd-ef23-050f-994884bf4cc7.png)

- 内容に沿って投稿していただくだけて投稿可能。

<br>
<br>
<br>

### 5. 仕事一覧

- 投稿した内容は、他のユーザーが書き込めないようにログイン中の userid と
created_by?メソッドを使用しアルバイトを作成したユーザーがアルバイト詳細ページを閲覧した時のみ削除・編集リンクを表示するようにしています。。<br>
- 削除ボタンを押すと、アラートでメッセージが表示され、OK ボタンを押すと削除されます。<br>

![スクリーンショット 2021-07-04 21.26.02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/53d818a2-c7ce-4ded-855e-1a0e061e613c.png)

<br>
<br>
<br>

### 6. 投稿した内容、アカウント削除

![アカウント削除.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/2ce207e3-d8af-073a-1d51-c6a3d4e857a3.gif)

- 投稿したアルバイトの一覧を表示。
- 編集ボタンで投稿したの内容を修正。
- 削除ボタンを押すとトップページ、マイページからも削除されます。
- アカウント削除ボタンをクリックすると削除されます。
  <br>
  <br>
  <br>

### 7. レスポンシブ対応

![レスポンシブ.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/7768f5de-b014-e41c-6dee-02ea3414ec41.gif)

- Bootstrap を使用してスマートフォンからでも使用可能
- デバイスによってハンバーガーメニューを実装
  <br>
  <br>
  <br>

### 8.バリデーション

- E-mail、Password は必須項目<br>
- パスワードは 6 文字以上の入力が必須<br>
- 登録済みのアドレスはアラートでお知らせ

![スクリーンショット 2021-07-04 19.39.20.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/9c4f0f5b-0977-515d-fc7b-95838ad1ea5b.png)



  <br>
  <br>
  <br>

### 10. 工夫したところ（実装面）

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

#### 11 今後実装したい内容

- 現在表示だけで、未実装なランキング形式での表示機能。<br>
- 場所選択時にGoogleMapとの連携で現在地までマップ表示できるように。<br>
- いろんなユーザーに使用してもらう為に、Room分けを取り付けたい。パスワードにて入室できるように。<br>
- 

  ![マイページ.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/953175/84bafa9e-1827-3ca6-d560-3e54251e70c8.gif)
