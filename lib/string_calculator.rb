class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.union(delimiter, Regexp.escape(custom_delimiter))
    end

    nums = numbers.split(delimiter).map(&:to_i)
    nums.reject! { |n| n > 1000 }
    negatives = nums.select(&:negative?)
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?

    nums.sum
  end

  def called_count
    @call_count
  end
end
