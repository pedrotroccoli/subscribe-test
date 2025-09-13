require_relative '../domain/tax_base'

class BasicSalesTax < TaxBase
  def apply_tax(product)
    if product.category.to_s == 'book' || product.category.to_s == 'food' || product.category.to_s == 'medical'
      return BigDecimal('0')
    end

    tax = product.price * 0.1

    # Round up to the nearest 0.05
    (tax * 20).ceil / 20.0
  end
end