namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [Rental, Renter, Garage, Car].each(&:delete_all)


    # Create Garages
    Faker::Config.locale = 'en-US'
    100.times do
      city = Faker::Address.city
      garage = Garage.create(
        address: Faker::Address.street_address + ', ' + city + ' ' + Faker::Address.state + ', ' + Faker::Address.zip,
        name: city + ' ' + Faker::Company.buzzword.titlecase + ' Garage')
      20.times do
        car = garage.cars.new
        car.rate = Faker::Commerce.price.to_f
        car.make = "makey"
        car.model = "model"
        car.year = Faker::Date.between(5.years.ago, Date.today).year
        car.plate = Faker::Internet.password(min_length=6, max_length=7).upcase
        car.mileage = rand(1000..100000)
        car.save
      end
    end



  end
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
