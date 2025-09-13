require_relative '../../implementations/basic_sales'

RSpec.describe BasicSalesTax do
  let (:basic_sales_tax) { BasicSalesTax.new }
  let (:book_product) { Product.new('Product', 'book', 10.0, false) }
  let (:technology_product) { Product.new('Product', 'technology', 10.0, false) }

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
      expect(basic_sales_tax.match?(book_product)).to be_truthy
    end

    it 'should return false if the product is not in the EXEMPT_CATEGORIES' do
      expect(basic_sales_tax.match?(technology_product)).to be_falsey
    end
  end

  describe "#apply_tax" do
    it 'should return 0 if the product is in the EXEMPT_CATEGORIES' do
      expect(basic_sales_tax.apply_tax(book_product)).to eq(BigDecimal('0'))
    end

    it 'should return the tax amount for a product that is not in the EXEMPT_CATEGORIES' do
      expect(basic_sales_tax.apply_tax(technology_product)).to eq(BigDecimal('1.0'))
    end
  end
end