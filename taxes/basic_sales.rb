require_relative '../domain/tax_base'

class BasicSalesTax < TaxBase
  def initialize
    super
  end

  def apply_tax(product)
    if product.category.to_s == 'book' || product.category.to_s == 'food' || product.category.to_s == 'medical'
      return BigDecimal('0')
    end

    product.price * 0.1
  end
end