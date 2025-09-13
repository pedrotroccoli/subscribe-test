class Checkout
  def initialize
    @items = []
  end

  def add_product(checkout_item)
    @items << checkout_item
  end

  def generate_receipt
    puts "All products: \n\n"
    total = 0

    @items.each do |item|
      total += item.product.price * item.quantity

      puts "#{item.quantity} #{item.product.name} #{item.product.price}"
    end

    puts "\n"
    puts "Sales Taxes: $0,00"
    puts "Total: $ #{total} \n\n"
  end
end