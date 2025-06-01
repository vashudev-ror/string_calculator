# lib/string_calculator.rb

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..] # everything after "//"
      delimiter = Regexp.union(delimiter, Regexp.escape(custom_delimiter))
    end

    numbers.split(delimiter).map(&:to_i).sum
  end
end
