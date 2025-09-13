require_relative '../../domain/tax_base'

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

  describe '#round_up' do
    it 'should round up the tax to the nearest 0.05' do
      list_of_numbers = [
        0.622,
        0.623,
        0.624,
        0.627,
      ]

      list_of_numbers.each do |number|
        correct_number = BigDecimal((number * 20).ceil) / 20.0
        expect(tax_base.round_up(BigDecimal(number.to_s))).to eq(correct_number)
      end
    end
  end
end