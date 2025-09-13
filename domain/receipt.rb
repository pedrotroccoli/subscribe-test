Receipt = Struct.new(:lines, :total, :taxes)

ReceiptItem = Struct.new(:quantity, :text, :price, :tax, :total_with_tax)