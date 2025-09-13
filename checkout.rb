require_relative './domain/receipt'

class Checkout
  def initialize(tax_manager)
    @tax_manager = tax_manager
    @items = []
  end

  def add_product(checkout_item)
    dup_checkout = self.dup
    dup_checkout.instance_variable_set(:@items, @items + [checkout_item])
    dup_checkout.freeze
    dup_checkout
  end

  def clear
    dup_checkout = self.dup
    dup_checkout.instance_variable_set(:@items, [])
    dup_checkout.freeze
  end

  def generate_receipt
    lines = []
    total = 0
    taxes = 0

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