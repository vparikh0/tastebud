class AddEntreeToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :Entree, :string
  end
end
