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
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood = params[:neighborhood]

    if @restaurant.save
      redirect_to "/restaurants/#{@restuarant.id}", :notice => "Restaurant created successfully."
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
