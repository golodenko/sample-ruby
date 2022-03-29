# frozen_string_literal: true

require 'pry'

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

    if width >= height && height.to_f / width < ratio
      a = [width, height].max
      b = a * ratio
    elsif width < height && height.to_f / width >= ratio
      b = [width, height].max
      a = b / ratio
    elsif ratio < 1
      b = [width, height].min
      a = b / ratio
    else
      a = [width, height].min
      b = a * ratio
    end

    [a, b]
  end

  def parse_time(str)
    parsed_time = DateTime.parse(str)
    parsed_time.hour * 3600 + parsed_time.min * 60
  end
end
