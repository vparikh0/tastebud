class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
    @reviews = Review.all 


  end

end
