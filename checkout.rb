class Checkout
  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def generate_receipt
    puts "All products: \n"
    puts "Sales Taxes: $0,00"
    puts "Total: $0,00"
  end
end