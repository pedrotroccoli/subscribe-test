require_relative '../../implementations/import_duty'

RSpec.describe ImportDutyTax do
  let (:import_duty_tax) { ImportDutyTax.new }

  describe 'Constants' do
    it 'should have a contanst rate of 5%' do
      expect(ImportDutyTax::RATE).to eq(BigDecimal('0.05'))
    end
  end

  describe '#match?' do
    it 'should return true if the product is imported' do
      product = Product.new('Product', 'book', 10.0, true)
      expect(import_duty_tax.match?(product)).to be_truthy
    end

    it 'should return false if the product is not imported' do
      product = Product.new('Product', 'technology', 10.0, false)
      expect(import_duty_tax.match?(product)).to be_falsey
    end
  end

  describe "#apply_tax" do
    it 'should return 0 if the product is not imported' do
      product = Product.new('Product', 'book', 10.0, false)
      expect(import_duty_tax.apply_tax(product)).to eq(BigDecimal('0'))
    end

    it 'should return the tax amount for a product that is imported' do
      product = Product.new('Product', 'technology', 10.0, true)
      expect(import_duty_tax.apply_tax(product)).to eq(BigDecimal('0.5'))
    end
  end
end