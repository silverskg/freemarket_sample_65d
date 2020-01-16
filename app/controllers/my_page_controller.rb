class MyPageController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.where(user_id: current_user).length
  end
end
