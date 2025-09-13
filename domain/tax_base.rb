class TaxBase 
  def apply_tax(product)
    raise NotImplementedError
  end

  def match?(product)
    raise NotImplementedError
  end

  # Round up to the nearest 0.05
  def round_up(tax)
    BigDecimal((tax * 20).ceil) / 20.0
  end
end
