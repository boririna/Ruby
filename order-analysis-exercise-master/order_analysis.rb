require_relative './order.rb'
require_relative './customer.rb'

class OrderAnalysis
  CSV_DELIMITER = ";"
  def initialize
    @customers_table = {}
    @orders_table = {}
  end

  def analyze
    analyze_customers
    analyze_orders
    @orders_table.each_pair do |order_id, order_value|
      @customers_table.each_pair do |customer_id, customer_value|
        if order_id == customer_id
          @customers_table[customer_id].attach_order(order_value)
        end
      end
    end

    @customers_table.each_pair do |customer_id, value|
      value.total
      value.print_order_info
    end
    # all_customers
    # all_orders
  end

  def analyze_customers
    customers_csv = File.read("customers.csv")
    customer_lines = customers_csv.split("\n")

    customer_lines.each do |customer_line|
      extract_customer(customer_line)
    end
  end

  def extract_customer(line)
    parts = line.split(CSV_DELIMITER)
    if parts.size != 4
      puts "[ERROR] Something's wrong with this customer line: #{line}!"
      return
    end

    customer_id = parts[0]
    first_name = parts[1]
    last_name = parts[2]
    location = parts[3]

    @customers_table[customer_id] = Customer.new(customer_id, first_name, last_name, location)
  end

  def all_customers
    puts @customers_table
  end

  def analyze_orders
    orders_csv = File.read("orders.csv")
    order_lines = orders_csv.split("\n")

    order_lines.each do |order_line|
      extract_order(order_line)
    end
  end

  def extract_order(line)
    parts = line.split(CSV_DELIMITER)
    if parts.size != 3
      puts "[ERROR] Something's wrong with this customer line: #{line}!"
      return
    end

    customer_id = parts[0]
    item = parts[1]
    price = parts[2]

    if !@orders_table.key?(customer_id)
      @orders_table[customer_id] = []
    end
    @orders_table[customer_id] << Order.new(customer_id, item, price)
  end

  def all_orders
    puts @orders_table.to_s
  end
end

OrderAnalysis.new.analyze
