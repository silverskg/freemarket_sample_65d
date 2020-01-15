class PurchaseController < ApplicationController

  require 'payjp'
  before_action :authenticate_user!
  before_action :check_user, only: :pay
  before_action :check_item, only: :pay

  def index
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    amount:  @item.price, #支払金額を入力（送料は一旦無視)
    customer: card.customer_id, #顧客ID
    currency: 'jpy' #日本円
  )
    
    @item.sale_status = "sold_out"
    if @item.save
      redirect_to root_path
    else
      render 'layouts/notifications'
      redirect_to item_product_confirmation_index_path(@item)
    end
    
  end

  def check_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def check_item
    if @item.sale_status == "sold_out"
      redirect_to root_path
    end
  end

end