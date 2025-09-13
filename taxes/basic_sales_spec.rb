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
end