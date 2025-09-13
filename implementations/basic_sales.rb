require_relative '../domain/tax_base'

class BasicSalesTax < TaxBase
  RATE = BigDecimal('0.1')
  EXEMPT_CATEGORIES = ['book', 'food', 'medical'].freeze

  def match?(product)
    EXEMPT_CATEGORIES.include?(product.category.to_s)
  end

  def apply_tax(product)
    if match?(product)
      return BigDecimal('0')
    end

    round_up(product.price * RATE)
  end
end