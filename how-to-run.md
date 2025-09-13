# How to Run This Project

This is a Ruby-based checkout system that calculates taxes and generates receipts for products. The system handles basic sales tax and import duty tax calculations with proper rounding rules.

## Prerequisites

- **Ruby** (version 2.7 or higher recommended)
- **Bundler** gem (for dependency management)

### Installing Bundler

```bash
gem install bundler
```

## Installation Steps

1. **Clone or navigate to the project directory:**
   ```bash
   cd /path/to/subscribe-test
   ```

2. **Install dependencies:**
   ```bash
   bundle install
   ```

   This will install the required gems specified in the `Gemfile` (currently just RSpec for testing).

## Running the Application

### Option 1: Run the main demo script
```bash
ruby init.rb
```

This will run the main demonstration script that shows three different shopping scenarios:
- Input 1: Books, music CD, and chocolate bar
- Input 2: Imported chocolates and imported perfume  
- Input 3: Mixed imported and domestic products

### Option 2: Run individual components
You can also run specific parts of the system by requiring the necessary files:

```ruby
# In a Ruby console (irb) or separate script
require_relative 'checkout'
require_relative 'domain/index'
require_relative 'implementations/index'

# Create a tax manager and checkout
tax_manager = TaxManager.new([BasicSalesTax.new, ImportDutyTax.new])
checkout = Checkout.new(tax_manager)

# Add products and generate receipts
# (See init.rb for examples)
```

## Running Tests

The project includes comprehensive RSpec tests. To run all tests:

```bash
bundle exec rspec
```

To run specific test files:
```bash
bundle exec rspec specs/checkout_spec.rb
bundle exec rspec specs/domain/tax_manager_spec.rb
bundle exec rspec specs/implementations/basic_sales_spec.rb
```

To run tests with detailed output:
```bash
bundle exec rspec --format documentation
```

## Project Structure

```
subscribe-test/
├── checkout.rb              # Main checkout class
├── init.rb                  # Demo script
├── Gemfile                  # Ruby dependencies
├── spec_helper.rb           # Test configuration
├── domain/                  # Core domain objects
│   ├── checkout_item.rb     # Product + quantity wrapper
│   ├── product.rb           # Product representation
│   ├── receipt.rb           # Receipt data structure
│   ├── receipt_printer.rb   # Receipt formatting
│   ├── tax_base.rb          # Base tax class
│   └── tax_manager.rb       # Tax calculation coordinator
├── implementations/         # Tax implementations
│   ├── basic_sales.rb       # 10% basic sales tax
│   └── import_duty.rb       # 5% import duty tax
└── specs/                   # Test files
    ├── checkout_spec.rb
    ├── domain/
    └── implementations/
```

## Expected Output

When you run `ruby init.rb`, you should see output similar to:

```
--------------------------------
2 Tranquility of Mind: 24.98
1 Music CD: 16.49
1 Chocolate Bar: 0.85
Sales Taxes: 1.50
Total: 42.32

--------------------------------
1 Box of Chocolates: 10.50
1 Perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

--------------------------------
1 Imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```

## Development

To modify or extend the system:

1. Make your changes to the relevant files
2. Run the tests to ensure nothing is broken: `bundle exec rspec`
3. Test your changes with: `ruby init.rb`
4. Add new tests for new functionality

The system is designed to be easily extensible - you can add new tax types by creating classes that inherit from `TaxBase` and registering them with the `TaxManager`.
