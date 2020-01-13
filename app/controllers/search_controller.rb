class SearchController < ApplicationController
  def index
    @items = Item.search(params[:keyword])
  end
end
