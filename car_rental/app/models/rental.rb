# == Schema Information
#
# Table name: rentals
#
#  id         :integer          not null, primary key
#  renter_id  :integer          not null
#  car_id     :integer          not null
#  duration   :integer
#  miles      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :garage
  has_one :car, through: :garage
end
