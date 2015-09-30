class Renter < ActiveRecord::Base
  has_many :rentals
  has_many :rented_cars, :through => :rentals, :source => :car
  has_many :garages_used, :through => :rentals, :source => :garage
end