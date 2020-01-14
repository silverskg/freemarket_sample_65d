class SearchController < ApplicationController
  def index
    @keyword = params[:keyword]
    @items = Item.search(params[:keyword])
    @itemsAll = Item.all
    @itemsPagination = @items.order(created_at: :desc).all.page(params[:page]).per(1)
  end
end
