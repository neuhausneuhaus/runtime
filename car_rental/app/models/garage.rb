# == Schema Information
#
# Table name: garages
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Garage < ActiveRecord::Base
  has_many :cars
  has_many :rental, through: :cars
  has_many :renters, through: :cars
end
