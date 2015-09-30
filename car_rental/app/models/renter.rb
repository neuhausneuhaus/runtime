# == Schema Information
#
# Table name: renters
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  age        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Renter < ActiveRecord::Base
  has_many :rentals
  has_many :rented_cars, :through => :rentals, :source => :car
  has_many :garages_used, :through => :rentals, :source => :garage
end
