class SearchController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.match(Item.name)
      @items = Item.search(params[:keyword])
    else
      @items = Item.all
    end
  end
end
