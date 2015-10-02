# == Schema Information
#
# Table name: cars
#
#  id        :integer          not null, primary key
#  rate      :decimal(8, 2)    not null
#  garage_id :integer          not null
#  make      :string           not null
#  model     :string           not null
#  mileage   :integer          not null
#  year      :integer          not null
#  plate     :string           not null
#
# Indexes
#
#  index_cars_on_garage_id  (garage_id)
#

class Car < ActiveRecord::Base
  has_many :rentals
  has_many :renters, through: :rentals
  belongs_to :garage
end

