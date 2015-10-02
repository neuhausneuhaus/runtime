# == Schema Information
#
# Table name: rentals
#
#  id             :integer          not null, primary key
#  renter_id      :integer          not null
#  car_id         :integer
#  duration_hours :integer
#  miles_driven   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_rentals_on_car_id  (car_id)
#

class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :car
  has_one :garage, through: :car
end
