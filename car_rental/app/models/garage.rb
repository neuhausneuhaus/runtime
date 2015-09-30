class Garage < ActiveRecord::Base
  has_many :cars
  has_many :rental, through: :cars
  has_many :renters, through: :cars
end
