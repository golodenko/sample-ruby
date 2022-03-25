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

  def smallest_rectangle_of_aspect(ratio, rectangle)
    width = rectangle[0]
    height = rectangle[1]

    if width >= height && height.to_f/width.to_f < ratio
      a = [width, height].max
      b = a * ratio
    else
      if width < height && height.to_f/width.to_f >= ratio
        b = [width, height].max
        a = b / ratio
      else
        if ratio < 1
          b = [width, height].min
          a = b / ratio
        else
          a = [width, height].min
          b = a * ratio
        end
      end
    end

    [a, b]
  end

  def parse_time(str)
    parsed_time = DateTime.parse(str)
    seconds = parsed_time.hour * 3600 + parsed_time.min * 60
  end
end
