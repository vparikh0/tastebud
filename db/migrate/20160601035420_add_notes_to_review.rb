class AddNotesToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :notes, :text
  end
end
