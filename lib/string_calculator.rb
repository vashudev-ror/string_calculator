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

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?

    nums.sum
  end
end
