# Alpha Camp 期末測驗︰Dojo_forum

## 體驗方式
* 帳號：admin@example.com
* 密碼：12345678

## 如何啟動？

```ruby
git clone git@github.com:victorloo/Dojo_forum_haml.git
bundle install
rake db:migrate
rake db:seed
rails dev:fake_users_simpson
rails dev:fake_user
rails dev:fake_others
```

## 開發環境

* Ruby version: 2.4.3
* Rails version: 5.1.6

### 使用的 gem

* [devise](https://rubygems.org/gems/devise)
* [simple_form](https://rubygems.org/gems/simple_form)
* [hamlit](https://rubygems.org/gems/hamlit)
* [carrierwave](https://rubygems.org/gems/carrierwave)
* [ffaker](https://rubygems.org/gems/ffaker)
* [kaminari](https://rubygems.org/gems/kaminari)
* [bootstrap-sass](https://rubygems.org/gems/bootstrap-sass)
* [filestack-rails](https://rubygems.org/gems/filestack-rails)

## 使用者故事
### 使用者認證
* 使用者可以註冊、登入 (使用 Devise gem)
* 除了文章總表，都需要登入

### 後台管理介面
* 進入後台必須有管理員 (admin) 權限
* 請撰寫 seed.rb，新增一組預設管理員，限定帳號：admin@example.com；密碼：12345678
* 後台可以 CRUD 文章的分類 (但不能刪除已經有被使用的分類)
* 後台可以瀏覽所有使用者清單，清單上可一目了然使用者的姓名、基本資料、是否有管理員 (admin) 權限
* 後台可以把其他使用者加為管理員 (admin)
* 管理員 (admin) 在前台瀏覽文章時，可以刪除任何人的文章

### 文章 CRUD
* 使用者可以瀏覽文章總表，並且在總表上一目瞭然：
* 每篇主題有多少回覆數 (replies_count)
* 每篇文章有多少瀏覽數 (viewed_count)
* 使用者可以瀏覽文章詳細內容
* 可以在同一頁直接進行回覆 (Comment)
* 在同一頁看見回覆內容，每頁最多顯示 20 筆回覆
* 若使用者是該文章/回覆的作者，在本頁面可以同步進行編輯和刪除 AJAX
* 使用者瀏覽文章總表時，預設是按 id 排序，但也可以自訂：
* 可選擇用「最後回覆時間」排序文章
* 可選擇用「最多人進行回覆」排序文章
* 可選擇用最多人瀏覽數排序文章
* 使用者可以張貼文章，每頁顯示 20 筆
* 張貼文章時，可以附檔上傳一張相片
* 使用者張貼文章時，可以選擇 Category (多選)，例如 [ ] 商業類 [ ] 技術類 [ ] 心理類
* 使用者可以瀏覽特定分類的文章
* 使用者瀏覽特定分類文章時，也可以進行分頁和進行排序

### Profile
* 在任何一個地方點擊使用者暱稱可以進行 Profile 頁，看到個人簡介，包括：
* 該使用者張貼過的文章
* 該使用者回覆過的文章
* 使用者可以收藏/取消收藏文章（按鈕以 AJAX 實作），且可以在 Profile 頁裡瀏覽自己收藏的文章列表

### 全站最新快訊
* 新增一個全站最新快訊的頁面，顯示以下資訊：
* 全站有多少使用者
* 全站總共有多少主題和回覆
* 最熱門的文章（最多人回覆）
* 聲量最大的使用者（最多回覆數）

### 文章狀態
* 新增文章時可以選擇草稿 (Draft) 狀態
* 草稿狀態只有自己看得到，稍候可以編輯將狀態改成「發布」。
* 草稿狀態的文章會統一歸進 Profile 頁面裡

### 好友
* 使用者可以對其他使用者發出好友請求
* 不能對自己發出好友請求、已經成為好友或已送出也不能再送
* 可以查看收到的好友請求，回覆答應或忽略（按鈕以 AJAX 實作）
* 在 Profile 頁裡可以瀏覽我的好友清單

### 文章權限
* 文章可以設定權限（使用者在瀏覽文章清單時，只會看見自己有權限的文章目錄）：
* 只有自己可以看
* 別人只能看不能留言
* 別人可以看也能留言
* 限好友才能看跟留言
