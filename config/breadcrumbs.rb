#1階層
crumb :root do
  link "メルカリ", root_path
end
#2階層
crumb :mypage do
  link "マイページ", mypage_index_path
  parent :root
end

crumb :category do
  link "カテゴリー一覧", category_index_path
  parent :root
end

#3階層
crumb :notification do
  link 'お知らせ', notification_mypage_index_path
  parent :mypage
end

crumb :todo do
  link 'やることリスト', todo_mypage_index_path
  parent :mypage
end

crumb :purchase do
  link '取引中', purchase_mypage_index_path
  parent :mypage
end

crumb :purchased do
  link '過去の取引', purchased_mypage_index_path
  parent :mypage
end

crumb :profile do
  link 'プロフィール', profile_mypage_index_path
  parent :mypage
end

crumb :card do
  link '支払い方法', card_mypage_index_path
  parent :mypage
end

crumb :logout do
  link 'ログアウト', logout_mypage_index_path
  parent :mypage
end

crumb :identification do
  link '本人情報の登録', identification_mypage_index_path
  parent :mypage
end

crumb :listing do
  link '出品した商品-出品中', listing_listings_path
  parent :mypage
end

crumb :in_progress do
  link '出品した商品-取引中', in_progress_listings_path
  parent :mypage
end

crumb :completed do
  link '出品した商品-売却済み', completed_listings_path
  parent :mypage
end


# crumb :user do |user|
#   link "@#{user.nickname}", user_path(user)
#   parent :users
# end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).