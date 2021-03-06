# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[Rental, Renter, Garage, Car].each(&:delete_all)

Faker::Config.locale = 'en-US'
  100.times do
    city = Faker::Address.city
    Garage.create(
      address: Faker::Address.street_address + ', ' + city + ' ' + Faker::Address.state + ', ' + Faker::Address.zip,
      name: city + ' ' + Faker::Company.buzzword.titlecase + ' Garage')
end

# =======   CARS   =========
# Table name: cars
#
#  id         :integer          not null, primary key
#  rate       :decimal(, )      not null
#  garage_id  :integer          not null
#  make_model :string           not null
#  mileage    :integer          not null
#  year       :integer          not null
#  plate      :string           not null
#


# =======  GARAGES =========
# Table name: garages
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# =======  RENTERS =========
# Table name: renters
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  age        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# =======  RENTALS =========
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
