# See README.md

class Customer
  attr_reader :customer_id, :first_name, :last_name, :location

  def initialize(customer_id, first_name, last_name, location)
    @customer_id = customer_id
    @first_name = first_name
    @last_name = last_name
    @location = location
  end

  def print_info
    puts "Customer #{@customer_id}: #{@first_name} #{@last_name} (#{@location})"
  end
end
