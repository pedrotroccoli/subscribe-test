require_relative '../domain/tax_base'

class BasicSalesTax < TaxBase
  RATE = BigDecimal('0.1')

  def apply_tax(product)
    if product.category.to_s == 'book' || product.category.to_s == 'food' || product.category.to_s == 'medical'
      return BigDecimal('0')
    end

    tax = product.price * RATE

    round_up(tax)
  end

  # Round up to the nearest 0.05
  def round_up(tax)
    (tax * 20).ceil / 20.0
  end
end