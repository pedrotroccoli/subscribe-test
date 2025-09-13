class Checkout
  def initialize
    @items = []
  end

  def add_product(checkout_item)
    @items << checkout_item
  end

  def generate_receipt
    puts "All products: \n\n"
    puts "Sales Taxes: $0,00"
    puts "Total: $0,00 \n\n"
  end
end