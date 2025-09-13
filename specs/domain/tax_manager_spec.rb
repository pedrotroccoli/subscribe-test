require_relative '../../domain/tax_manager'

RSpec.describe TaxManager do
  let (:product) { Product.new('Product', 'book', 10.0, false) }
  let (:any_tax_rule) { instance_double(TaxBase) }
  let (:any_tax_rule_2) { instance_double(TaxBase) }
  let (:tax_manager) { TaxManager.new([any_tax_rule, any_tax_rule_2]) }

  describe 'Methods' do
    before do
      allow(any_tax_rule).to receive(:apply_tax).with(product).and_return(BigDecimal('1.0'))
      allow(any_tax_rule_2).to receive(:apply_tax).with(product).and_return(BigDecimal('2.0'))
    end

    it 'should call the apply_tax method of the tax rules' do
      tax_manager.apply_taxes(product)

      expect(any_tax_rule).to have_received(:apply_tax).with(product)
      expect(any_tax_rule_2).to have_received(:apply_tax).with(product)
    end

  end

  describe '#apply_taxes' do
    before do
      allow(any_tax_rule).to receive(:apply_tax).with(product).and_return(BigDecimal('1.0'))
      allow(any_tax_rule_2).to receive(:apply_tax).with(product).and_return(BigDecimal('2.0'))
    end

    it 'should return the sum of the taxes applied to the product' do
      expect(tax_manager.apply_taxes(product)).to eq(BigDecimal('3.0'))
    end
  end
end