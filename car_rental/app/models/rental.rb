class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :garage
  has_one :car, through: :garage
end
