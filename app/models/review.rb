class Review < ActiveRecord::Base

  validates :restaurant_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :restaurant

  belongs_to :user
end
