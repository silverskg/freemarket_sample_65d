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

crumb :categories do
  link "カテゴリー一覧", category_index_path
  parent :root
end

crumb :category do
  category = Category.find(params[:id])
  link "#{category.name}", category_path(category.id)
  parent :categories
end

crumb :sellItem do
  link "出品した商品 - 出品中", sell_items_path
  parent :mypage
end

crumb :sellItemShow do
  link "出品商品画面", sell_item_path
  parent :sellItem
end