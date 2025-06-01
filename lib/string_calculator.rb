class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(input)
    @call_count += 1
    return 0 if input.empty?

    delimiter = extract_delimiter(input)
    numbers_string = extract_numbers_string(input)
    numbers = parse_numbers(numbers_string, delimiter)

    validate_no_negatives(numbers)

    numbers.reject { |n| n > 1000 }.sum
  end

  def called_count
    @call_count
  end

  private

  def extract_delimiter(input)
    return /,|\n/ unless input.start_with?('//')

    header = input.split("\n", 2).first
    delimiters = if header.include?('[')
                   header.scan(/\[([^\]]+)\]/).flatten
                 else
                   [header[2..]]
                 end
    Regexp.union(delimiters)
  end

  def extract_numbers_string(input)
    input.start_with?('//') ? input.split("\n", 2).last : input
  end

  def parse_numbers(numbers_string, delimiter)
    numbers_string.split(delimiter).map(&:to_i)
  end

  def validate_no_negatives(numbers)
    negatives = numbers.select(&:negative?)
    raise "negatives not allowed #{negatives.join(',')}" unless negatives.empty?
  end
end
