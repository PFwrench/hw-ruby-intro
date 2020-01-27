# When done, submit this entire file to the autograder.

# Part 1

require 'set'

def sum arr
  total = 0
  for val in arr do
    total += val
  end
  total
end

def max_2_sum arr
  if arr.length < 3
    return arr.inject(0, :+)
  end

  top_2 = [arr.at(0), arr.at(1)].sort
  for val in arr.drop(2)
    if val > top_2[1]
      top_2[1] = val
    elsif val > top_2[0]
      top_2[0] = val
    end
  end

  top_2[0] + top_2[1]
end

def sum_to_n? arr, n
  pairs = Set.new
  for val in arr
    if pairs.include?(val)
      return true
    else
      pairs.add(n - val)
    end
  end

  false
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  s.strip
  if s.length == 0
    return false
  end
  /[b-df-hj-np-tv-z]{1}/.match?(s.chars.first.downcase)
end

def binary_multiple_of_4? s
  if not /^[0,1,\s]+$/.match?(s)
    return false
  end
  
  # Remove whitespace in binary number
  s.gsub(/\s+/, "")

  base = 2
  power = 0
  total = 0
  for chr in s.chars.reverse
    if chr == "1"
      total += base**power
    end
    power += 1
  end

  total % 4 == 0
end

# Part 3

def is_valid_isbn? isbn
  isbn.gsub(/\s+/, "")
  isbn.length > 0
end

class BookInStock
  attr_reader :isbn, :price
  attr_writer :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError, "ISBN is not valid" unless is_valid_isbn?(isbn)
    raise ArgumentError, "Price is not valid" unless price > 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    "$%.2f" % @price
  end

end
