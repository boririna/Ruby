require_relative './order.rb'
require_relative './customer.rb'

class OrderAnalysis
  CSV_DELIMITER = ";"

  def analyze
    analyze_customers
    analyze_orders
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

    Customer.new(customer_id, first_name, last_name, location).print_info
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

    Order.new(customer_id, item, price).print_info
  end
end

OrderAnalysis.new.analyze
