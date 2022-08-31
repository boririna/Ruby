# See README.md

class Customer
  attr_reader :customer_id, :first_name, :last_name, :location

  def initialize(customer_id, first_name, last_name, location)
    @customer_id = customer_id
    @first_name = first_name
    @last_name = last_name
    @location = location
    @order_list = []
  end

  def attach_order(customer_order)
    @order_list << customer_order
  end

  def compute_total
    sum = 0
    @order_list.each do |order|
      sum += order.price.delete("€").to_f
    end
    sum
  end

  def print_info
    puts "Customer #{@customer_id}: #{@first_name} #{@last_name} (#{@location})"
  end

  def print_order_info
    puts "Orders for Customer #{customer_id}:"
    @order_list.each do |order|
      puts "- #{order.item} #{order.price}"
    end
    puts "Total: €#{compute_total.round(2)}"
    puts ""
  end
end
