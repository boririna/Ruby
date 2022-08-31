# See README.md

class Customer
  attr_reader :customer_id, :first_name, :last_name, :location

  def initialize(customer_id, first_name, last_name, location)
    @customer_id = customer_id
    @first_name = first_name
    @last_name = last_name
    @location = location
    @order_list = []
    @sum = 0
  end

  def attach_order(customer_orders)
    @order_list = customer_orders
  end

  def total
    @order_list.each do |order|
      @sum += order.price.delete("€").to_f
    end
  end

  def print_info
    puts "Customer #{@customer_id}: #{@first_name} #{@last_name} (#{@location})"
  end

  def print_order_info
    puts "Orders for Customer #{customer_id}:"
    @order_list.each do |order|
      puts "- #{order.item} #{order.price}"
    end
    puts "Total: €#{@sum.round(2)}"
    puts ""
  end
end
