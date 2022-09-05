require_relative './order.rb'
require_relative './customer.rb'
# ARGV

class OrderAnalysis
  CSV_DELIMITER = ";"

  def main
    # a table: {key: customer_id (int), value: Customer instance}
    customers_table = load_customers('customers.csv')
    # a list [list of Orders]
    orders_list = load_orders('orders.csv')
    orders_list.each do |order|
      cust_id = order.customer_id
      if customers_table.key?(cust_id)
        customers_table[cust_id].attach_order(order)
      else
        puts "Customer not found: #{cust_id}"
      end
    end

    customers_table.each_pair do |customer_id, customer|
      # customer.compute_total
      customer.print_order_info
    end

    # make a list of customers from the table
    # sort the list of customers according to compute_tital
    customers_list = []
    customers_table.each_pair do |customer_id, customer|
      customers_list << customer
    end
    # customer_sorted = customer_list.sort { |a, b| -(a.compute_total <=> b.compute_total) }
    customers_sorted = customers_list.sort_by { |a| -a.compute_total }
    customers_sorted.each do |customer|
      customer.print_sorted
    end
  end

  def load_customers(filename)
    # Args:
    #   filename: str, input filename to read from
    # Returns:
    #   a table of customers loaded from the file.
    #   keys are customer ids (int),
    #   values are Customer instances.
    customers_csv = File.read(filename)
    customer_lines = customers_csv.split("\n")

    customers_table = {}
    customer_lines.each do |line|
      customer = extract_customer(line)
      customers_table[customer.customer_id] = customer
    end
    customers_table
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

    Customer.new(customer_id, first_name, last_name, location)
  end

  def load_orders(filename)
    orders_csv = File.read(filename)
    order_lines = orders_csv.split("\n")

    orders = []
    order_lines.each do |order_line|
      orders << extract_order(order_line)
    end
    orders
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

    Order.new(customer_id, item, price)
  end
end

OrderAnalysis.new.main
