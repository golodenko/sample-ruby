require 'pry'
# frozen_string_literal: true

module Algorithms
  module_function

  INT_ERROR = "FizzBuzz param should be positive Integer".freeze

  def fizzbuzz(max)

    raise INT_ERROR if !max.is_a?(Integer) || max < 1

    result = (1..max).map do |i|
    case
    when i % 15 == 0 then "fizzbuzz"
    when i % 3 == 0 then "fizz"
    when i % 5 == 0 then "buzz"
    else i
    end
  end

  end

  def smallest_rectangle_of_aspect(ratio, rectangle); end

  def parse_time(str); end
end
