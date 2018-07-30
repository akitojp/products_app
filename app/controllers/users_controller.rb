class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @likes = @user.likes.includes(:product)
    @products = Product.take(3)
  end
end
