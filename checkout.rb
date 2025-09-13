class Checkout
  def initialize(tax_manager)
    @tax_manager = tax_manager
    @items = []
  end

  def add_product(checkout_item)
    @items << checkout_item
  end

  def clear
    @items = []
  end

  def generate_receipt
    lines = []
    total = 0
    taxes = 0

    puts "All products: \n\n"

    ReceiptItem = Struct.new(:quantity, :text, :price, :tax, :total_with_tax)
    Receipt = Struct.new(:lines, :total, :taxes)

    @items.each do |item|
      all_taxes = @tax_manager.apply_taxes(item.product)

      product_after_taxes = item.product.price + all_taxes
      total_products = product_after_taxes * item.quantity

      total += total_products
      taxes += all_taxes * item.quantity
      
      lines << ReceiptItem.new(
        item.quantity,
        item.product.name, 
        item.product.price, 
        all_taxes, 
        total_products
      )
    end

    Receipt.new(lines, total, taxes)
  end
end