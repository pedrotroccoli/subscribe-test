class TaxManager
  def initialize(tax_rules)
    @tax_rules = tax_rules
  end

  # We are going to apply all the taxes to the product and return the total amount of taxes
  def apply_taxes(product)
    @tax_rules.reduce(BigDecimal('0')) do |sum, tax_rule|
      sum + tax_rule.apply_tax(product)
    end
  end
end