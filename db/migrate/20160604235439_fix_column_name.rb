class FixColumnName < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.rename :Appetizer, :appetizer
      t.rename :Entree, :entree
      t.rename :Dessert, :dessert
    end

    change_column(:reviews, :date, :text)
  end
end
