# namespace :db do
#   desc "Erase and fill database"
  task :populate => :environment do

    # rake --silent my_task

    # 
    def renter_table_populated?
      Renter.all.size
      rescue ActiveRecord::NoDatabaseError
        false
      else
        true
    end

    # binding.pry
    def seed_db
      # binding.pry
      require_relative '../assets/car_list.rb'
      # Create Garages
      Faker::Config.locale = 'en-US'
      100.times do

        city = Faker::Address.city
        garage = Garage.create(
          address: Faker::Address.street_address + ', ' + city + ' ' + Faker::Address.state + ', ' + Faker::Address.zip,
          name: city + ' ' + Faker::Company.buzzword.titlecase + ' Garage'
        )
        # Create 20 cars for each garage
        20.times do

          car = garage.cars.new
          car_info = @car_array[rand(0..1055)]
          car.rate = Faker::Commerce.price.to_f
          car.year = car_info[0]
          car.make = car_info[1]
          car.model = car_info[2]
          car.plate = Faker::Internet.password(min_length=6, max_length=7).upcase
          car.mileage = rand(1000..100000)
          car.save
        end
      end

      # Create Renters
      800.times do
        renter = Renter.create(
          name: Faker::Name.name,
          age: rand(18..80)
        )
        # Create 1-20 rentals per renter
        rand(1..20).times do
          rental = renter.rentals.new
          #Assign a random car to rental
          rental.car = Car.find(rand(1..Car.all.size))
          rental.duration_hours = (rand(1..48))
          rental.miles_driven = (rand(1..1000))
          rental.save
        end
      end

    end # /seed_db method



    if renter_table_populated?
      # Prompt user to reseed or continue
      puts "\nIt appears that your database is already seeded.", "Reseeding will take some time, and, due to randomized quantity of rows, may prevent runtime comparisons to previous tests.", "\nWOULD YOU LIKE TO SKIP RESEED AND CONTINUE TO RUNTIME TEST?".bold
      reseedOpt = $stdin.gets.chomp.downcase
      answered = false
      while (not answered)  
        if (reseedOpt == "no") or (reseedOpt == "no")
          answered = true
          Rake::Task["db:migrate:reset"].invoke
          seed_db
          Rake::Task["runtime_test"].invoke
        elsif (reseedOpt == "y") or (reseedOpt == "yes")
          answered = true
          puts "\ncontinuing to runtime tests.. \n\n\n"
          Rake::Task["runtime_test"].invoke
        else
          puts "I don't understand.", "Please type either 'Y' or 'N'", " ", "WOULD YOU LIKE TO SKIP RESEED?"
          reseedOpt = $stdin.gets.chomp.downcase
        end
      end

    else
      # Rake::Task["db:create"].invoke
      Rake::Task["db:migrate:reset"].invoke
      seed_db
      Rake::Task["runtime_test"].invoke
    end



  end
  # end



