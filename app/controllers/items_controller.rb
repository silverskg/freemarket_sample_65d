class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(id: "DESC").includes(:images)
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)

    #画像ファイルがUPされている場合
    if params[:item][:images_attributes]
      @item.include_image = "include"
    end

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    #imageがアップされている場合
    if params[:item][:images_attributes]
      @item.include_image = "include"
    else 
      @item.include_image = ""
    end

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
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
      #field_forで設定した値+_attributesで受け取る。
      images_attributes: [:image, :_destroy, :id]
    ).merge(user_id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
