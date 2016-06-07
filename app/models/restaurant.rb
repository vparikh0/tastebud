class Restaurant < ActiveRecord::Base
  validates :name, :presence => true
  validates :neighborhood, :presence => true
  
  has_many :reviews
end
