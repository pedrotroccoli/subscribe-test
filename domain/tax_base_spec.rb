require_relative 'tax_base'

RSpec.describe TaxBase do
  let (:product) { Product.new('Product', 'book', 10.0, false) }
  let (:tax_base) { TaxBase.new }

  describe 'Methods' do
    it 'should have a method to apply the tax' do
      expect {tax_base.apply_tax(product) }.to raise_error(NotImplementedError)
    end

    it 'should have a method to match the product' do
      expect { tax_base.match?(product) }.to raise_error(NotImplementedError)
    end
  end
end