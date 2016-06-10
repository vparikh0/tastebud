require "open-uri"

class RestaurantsController < ApplicationController
  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new_search
    @q = Restaurant.ransack(params[:q])
    @restaurant = Restaurant.new
  end

  def new
    @q = Restaurant.ransack(params[:q])
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood = params[:neighborhood]

    # Read restaurant info from Name search
    # url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@restaurant.name}&type=restaurant&key=AIzaSyBOcjx2-pkCnJam_fhWonH9uWmeMr-bM20"
    #
    # parsed_data_map = JSON.parse(open(url).read)
    #
    # @latitude = parsed_data_map["results"][0]["geometry"]["location"]["lat"]
    #
    # @longitude = parsed_data_map["results"][0]["geometry"]["location"]["lng"]

  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood = params[:neighborhood]

    if @restaurant.save
      redirect_to "/restaurants/#{@restaurant.id}", :notice => "Restaurant created successfully."
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood = params[:neighborhood]

    if @restaurant.save
      redirect_to "/restaurants", :notice => "Restaurant updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to "/restaurants", :notice => "Restaurant deleted."
  end
end
