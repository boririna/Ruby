# See README.md
class Order
  attr_reader :customer_id, :item, :price

  def initialize(customer_id, item, price)
    @customer_id = customer_id
    @item = item
    # can delete a euro sign here in the price
    @price = price
  end

  def print_info
    puts "Order for Customer #{customer_id}: #{item} #{price}"
  end

  # def to_s
  #   return "Order for Customer #{customer_id}: #{item} #{price}"
  # end
end
