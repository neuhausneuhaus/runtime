task :runtime_test => :environment do
  require 'benchmark'
  include Benchmark #needed for Benchmark.benchmark formatting constants

  divline = ("=" * 75).to_s
  puts divline
  puts "The chart below uses Rails' Benchmark module to show",
  "-user CPU time,", 
  "-system CPU time,", 
  "-sum of the user and system CPU times,",
  "-and the elapsed real time",
  "needed to execute an otherwise similar ActiveRecord query on this database",
  "using"+" .includes, .joins, and all.each".bold,
  "\n(All time units are seconds.)\n"
  

  # Rehearsal Benchmark test (hidden). Runs prior to actual test, to avoid discrepencies based on the order in which items in test are run (due to the cost of memory allocation and ruby garbage collection)
  Benchmark.benchmark("", 0, "".hide, "") do |x|
    inc = x.report("") {Car.includes(:rentals, :renters).where('cars.mileage >50000')}
    joi = x.report("") {Car.joins(:rentals, :renters).where('cars.mileage >50000')}
    eac = x.report("") do
      Car.all.each do |car| 
        car.rentals.where('cars.mileage>50000')
        car.renters.where('cars.mileage>50000')
      end
    end
  end
  
  puts "\n",divline,divline
  
  #Actual Benchmark
  Benchmark.benchmark(CAPTION.titleize.colorize(:cyan), 15, FORMAT.underline, "| >>avg:        ".bold) do |x|
    inc = x.report("| .includes: ") {Car.includes(:rentals, :renters).where('cars.mileage >50000')}
    joi = x.report("| .joins:    ") {Car.joins(:rentals, :renters).where('cars.mileage >50000')}
    eac = x.report("| all.each:  ") do
      Car.all.each do |car| 
        car.rentals.where('cars.mileage>50000')
        car.renters.where('cars.mileage>50000')
      end
    end
    @realtimes = {".includes": inc.real, ".joins": joi.real, "all.each": eac.real}.sort_by{|k,v| v}
    [(inc+joi+eac)/3]
  end

  puts divline
  
  puts "Fastest Method is #{@realtimes[0][0].upcase}, beating #{@realtimes[1][0].upcase} by #{@realtimes[1][1] - @realtimes[0][1]} seconds".colorize(:cyan).bold
  
  puts divline, divline, "\n\n"

end