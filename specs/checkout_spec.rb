require 'bigdecimal'
require_relative '../checkout'
require_relative '../domain/tax_manager'

RSpec.describe Checkout do
  let(:tax_manager) { instance_double('TaxManager') }
  let(:checkout) { Checkout.new(tax_manager) }
  let(:product) { double('Product', name: 'Book', category: 'book', price: 10.0, imported: false) }
  let(:checkout_item) { double('CheckoutItem', product: product, quantity: 1) }

  describe '#add_product' do
    it 'returns a new checkout with the product added' do
      new_checkout = checkout.add_product(checkout_item)
      
      expect(new_checkout).to be_a(Checkout)
      expect(new_checkout).not_to be(checkout) # Should be a different object
    end

    it 'adds multiple products correctly' do
      product2 = double('Product', name: 'CD', category: 'music', price: 15.0, imported: false)
      checkout_item2 = double('CheckoutItem', product: product2, quantity: 2)
      
      new_checkout = checkout.add_product(checkout_item)
      final_checkout = new_checkout.add_product(checkout_item2)
      
      expect(final_checkout).to be_a(Checkout)
    end
  end

end