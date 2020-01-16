class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: "DESC").includes(:images)
  end

  def new
    @item = Item.new 
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to sell_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to sell_items_path
    else
      render 'layouts/notifications'
      redirect_to action: 'show'
    end
  end
  
  private
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
    ).merge(user_id: current_user.id, sale_status: "on_sale")
  end

  def set_item
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @brand = Brand.find(@item.brand_id)
    @prefecture = Prefecture.find(@item.region)
    @brand_items = Item.where(brand_id: @item.brand_id)
    @user_items = Item.where(user_id: @item.user_id)
    @images = Image.where(item_id:  @item.id)
  end

  def check_user
    if current_user != @user
      redirect_to root_path
    end
  end
  
end
