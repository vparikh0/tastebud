class AddAppetizerToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :Appetizer, :string
  end
end
