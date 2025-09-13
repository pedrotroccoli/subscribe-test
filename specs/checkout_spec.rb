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
  end
end