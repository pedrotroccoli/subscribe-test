require_relative '../domain/receipt_printer'

class BasicPrinter < ReceiptPrinter
  def self.print(receipt)
    puts "\n"

    receipt.lines.each do |line|
      puts "#{line.quantity} #{line.text} #{line.total_with_tax.to_f.round(2)}"
    end

    puts "\n"

    puts "Sales Taxes: $ #{receipt.taxes.to_f.round(2)}"
    puts "Total: $ #{receipt.total.to_f.round(2)}"
  end
end