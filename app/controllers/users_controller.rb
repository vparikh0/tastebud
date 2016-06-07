class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
    @reviews = Review.all
  end

  # def street_to_weather
  #   @street_address = params[:user_street_address]
  #   url_safe_street_address = URI.encode(@street_address)
  #
  #   url =
  #
  #   parsed_data = JSON.parse(open(url).read)
  #   latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
  #   longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  #
  # end
end
