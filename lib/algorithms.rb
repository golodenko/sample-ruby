# frozen_string_literal: true

require 'pry'

# Algorithms
module Algorithms
  module_function

  INT_ERROR = 'FizzBuzz param should be positive Integer'

  def fizzbuzz(max)
    raise INT_ERROR if !max.is_a?(Integer) || max < 1

    (1..max).map do |i|
      if (i % 15).zero?
        'fizzbuzz'
      elsif (i % 3).zero?
        'fizz'
      elsif (i % 5).zero?
        'buzz'
      else
        i
      end
    end
  end

  def smallest_rectangle_of_aspect(ratio, rectangle)
    width = rectangle[0]
    height = rectangle[1]
    max = [width, height].max
    min = [width, height].min

    if width >= height && height.to_f / width < ratio
      [max, max * ratio]
    elsif width < height && height.to_f / width >= ratio
      [max / ratio, max]
    elsif ratio < 1
      [min / ratio, min]
    else
      [min, min * ratio]
    end
  end

  def parse_time(str)
    parsed_time = DateTime.parse(str)
    parsed_time.hour * 3600 + parsed_time.min * 60
  end
end
