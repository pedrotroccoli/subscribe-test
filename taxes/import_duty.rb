require_relative '../domain/tax_base'

class ImportDutyTax < TaxBase
  RATE = BigDecimal('0.05')

  def match?(product)
    product.imported
  end

  def apply_tax(product)
    unless match?(product)
      return BigDecimal('0')
    end

    round_up(product.price * RATE)
  end
end