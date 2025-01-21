class Carnival

  attr_accessor :duration, :rides, :list_of_visitors, :visitor_count
  @@total_revenue

  def initialize(duration)
    @duration = duration
    @rides = []
    @list_of_visitors = Hash.new{ |hash, key| hash[key] = { favorite_ride: nil, money_spent: 0 } }
    @visitor_count = 0
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by do |ride|
      ride.times_ridden
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    @@total_revenue = @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def summary
    summary = {
      'Visitor count' => @visitor_count,
      'Revenue earned' => @total_revenue,
      'List of visitors' => @list_of_visitors
    }
  end

  def visitor_count
    @rides.each do |ride|
      @visitor_count += ride.rider_log.keys.count
    end
  end

  def visitor_list
    @rides.each do |ride|
      ride.rider_log.each do |visitor, ride_count|
    end
  end
end