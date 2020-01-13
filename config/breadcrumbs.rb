crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", my_page_index_path
  parent :root
end

crumb :editProfile do
  link "プロフィール", edit_profile_index_path
  parent :mypage
end

crumb :profileInformation do
  link "本人情報の確認", information_index_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_index_path
  parent :mypage
end

crumb :payment do
  link "支払い方法", root_path
  parent :mypage
end




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