class MyPageController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end
end
