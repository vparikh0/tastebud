class AddDessertToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :Dessert, :string
  end
end
