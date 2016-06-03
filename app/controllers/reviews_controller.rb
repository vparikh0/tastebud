class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.restaurant_id = params[:restaurant_id]
    @review.user_id = params[:user_id]
    @review.notes = params[:notes]

    @review.date = params[:date]
    @review.appetizer = params[:appetizer]
    @review.entree = params[:entree]
    @review.dessert = params[:dessert]
    @review.rating = params[:rating]

    if @review.save
      redirect_to "/reviews", :notice => "Review created successfully."
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    @review.restaurant_id = params[:restaurant_id]
    @review.user_id = params[:user_id]

    if @review.save
      redirect_to "/reviews", :notice => "Review updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    redirect_to "/reviews", :notice => "Review deleted."
  end
end
