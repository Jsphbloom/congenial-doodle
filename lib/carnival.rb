class Carnival

  attr_accessor :duration, :rides, :total_revenue

  def initialize(duration)
    @duration = duration
    @rides = []
    @total_revenue
    @list_of_visitors
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
    @total_revenue = @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def summary
    summary = {
      'Visitor count' => visitor_count
      'Revenue earned' => @total_revenue
      'List of visitors' => @list_of_visitors
    }
  end

  private

  def visitor_count
    count = 0
    @rides.each do |ride|
      count += ride.rider_log.keys.count
    end
    count
  end
end