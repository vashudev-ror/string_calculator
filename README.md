# String Calculator Kata

This is an implementation of the [String Calculator Kata](http://osherove.com/kata) by Roy Osherove using Ruby and Test-Driven Development (TDD).

## Overview

The goal of this kata is to practice TDD and incrementally develop a String Calculator class with an `add` method that can:

- Handle 0, 1, or 2 numbers in a string and return their sum.
- Handle an unknown amount of numbers.
- Support commas and newlines as delimiters.
- Support custom delimiters of any length and multiple delimiters.
- Throw exceptions on negative numbers, listing all negatives found.
- Ignore numbers greater than 1000.
- Track the number of times the `add` method is called.

## Getting Started

### Prerequisites

- Ruby (>= 2.6)
- Bundler (`gem install bundler`)

### Setup

1. Clone the repository:

   ```bash
   git clone <your-repo-url>
   cd string_calculator
   ```

2. Install the dependencies specified in the Gemfile:

   ```bash
   bundle install
   ```

3. Run tests:

   ```bash
   bundle exec rspec
   ```

4. Run RuboCop for style checks:

   ```bash
   bundle exec rubocop
   ```

## Usage

Example usage of the `StringCalculator` class:

```ruby
calculator = StringCalculator.new

# Adding numbers separated by comma or newline
result = calculator.add("1,2\n3")   # => 6

# Using custom delimiters
result = calculator.add("//[***]\n1***2***3")  # => 6

# Handling negative numbers throws an error
calculator.add("1,-2") # raises "negatives not allowed -2"

# Numbers greater than 1000 are ignored
calculator.add("2,1001")  # => 2

# Get how many times add was called
count = calculator.called_count
```

## Features Implemented

- Returns `0` for empty string input.
- Supports multiple numbers separated by commas or newlines.
- Supports custom single or multiple delimiters of any length.
- Throws exception for negative numbers, listing all negatives found.
- Ignores numbers greater than 1000.
- Tracks and returns the number of times the `add` method has been called.
- Developed following Test Driven Development (TDD) principles.
- Enforces code quality using RuboCop.

## Code Coverage

Code coverage is measured using [SimpleCov](https://github.com/simplecov-ruby/simplecov).

To generate a coverage report:

```bash
bundle exec rspec
```

After running the tests, open the report in your browser:

```bash
open coverage/index.html   # For macOS
# or
xdg-open coverage/index.html  # For Linux
```

This will display an HTML report showing how much of your code is covered by tests.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Write tests for your feature or fix.
4. Submit a pull request.










