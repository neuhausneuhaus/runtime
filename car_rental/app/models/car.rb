class Car < ActiveRecord::Base
  has_many :rentals
  has_many :renters, through: :rentals
  belongs_to :garage
end

