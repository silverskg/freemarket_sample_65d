class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
    @item.images.build
  end

  def create
    item = Item.create(item_params)
    redirect_to root_path
  end

  private
  # ユーザーidは、ユーザー登録後に実装(現在は仮で1を挿入)
  def item_params
    params.require(:item).permit(
      :name, 
      :status, 
      :body, 
      :deliver_fee, 
      :delivery_date, 
      :how_to_deliver, 
      :region, 
      :price, 
      :category_id, 
      :brand_id,
      images_attributes: {image: []}
    ).merge(user_id: 1)
  end

end
