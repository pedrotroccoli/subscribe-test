require_relative 'basic_sales'

RSpec.describe BasicSalesTax do
  describe 'Constants' do
    it 'should return a list of prefixed categories' do
      expect(BasicSalesTax::EXEMPT_CATEGORIES).to eq(['book', 'food', 'medical'])
    end

    it 'should have a contanst rate of 10%' do
      expect(BasicSalesTax::RATE).to eq(BigDecimal('0.1'))
    end
  end

  describe '#match?' do
    it 'should return true if the product is in the EXEMPT_CATEGORIES' do
      product = Product.new('Product', 'book', 10.0, false)
      expect(BasicSalesTax.new.match?(product)).to be_truthy
    end

    it 'should return false if the product is not in the EXEMPT_CATEGORIES' do
      product = Product.new('Product', 'technology', 10.0, false)
      expect(BasicSalesTax.new.match?(product)).to be_falsey
    end
  end
end