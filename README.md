# SKHU LikeLion 6th (2018-06-29)
## Debugging Contest Answer

## 풀이
* 다양한 방법이 있을 수 있습니다.

### 1. bundle install

---

### 2. routes.rb
* =>
* root 'home#index'

---

### 3. rake db:drop & rake db:migrate

---

### 4. application_controller.rb
* end

---

### 5. application.html.erb
* <%= yield %>

---

### 6. Sign up

---

### 7. 새로운 글 생성 불가
* home_controller.rb
    * create & new (swap)

---

### 8. new.html.erb
* method = 'post'
* form-data

---

### 9. post.rb & user.rb 관계 설정
* has_many
* belongs_to

---

### 10. rake db:drop & rake db:migrate

---

### 11. 글 작성은 되지만, 제목과 내용이 안 보임
* new.html.erb
    * post_title
    * post_content

---

### 12. 수정 불가
* routes.rb
    * update(post)
* edit.html.erb
    * token (CSRF)
* home_controller.rb - update action
    * find_or_create_by
    * save

---

### 13. 삭제 불가
* home_controller :: delete action
    * destroy

---

### 14. 댓글 생성 및 삭제 불가
* routes.rb
    * comments#(create, delete)
* Comment_controller.rb
    * Comment.new & Comment.find
