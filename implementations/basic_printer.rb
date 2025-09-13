require_relative '../domain/receipt_printer'

class BasicPrinter < ReceiptPrinter
  def self.print(receipt)
    puts "\n"

    receipt.lines.each do |line|
      puts "#{line.quantity} #{line.text} #{format_money(line.total_with_tax)}"
    end

    puts "\n"

    puts "Sales Taxes: #{format_money(receipt.taxes)}"
    puts "Total: #{format_money(receipt.total)}"
  end

  def self.format_money(dec)
    format('%.2f', dec.to_f)
  end
end