# frozen_string_literal: true

require 'algorithms'

RSpec.describe 'Algorithms' do
  describe '.fizzbuzz' do
    context "when max param is" do
      context "blank" do
        it 'raises error' do
          expect { Algorithms.fizzbuzz("") }.to raise_error('FizzBuzz param should be positive Integer')
        end
      end

      context "negative" do
        it 'raises error' do
          expect { Algorithms.fizzbuzz(-1) }.to raise_error('FizzBuzz param should be positive Integer')
        end
      end

      context "nil" do
        it 'raises error' do
          expect { Algorithms.fizzbuzz(nil) }.to raise_error('FizzBuzz param should be positive Integer')
        end
      end

      context "string" do
        it 'raises error' do
          expect { Algorithms.fizzbuzz("22") }.to raise_error('FizzBuzz param should be positive Integer')
        end
      end

      context "0" do
        it 'raises error' do
          expect { Algorithms.fizzbuzz(0) }.to raise_error('FizzBuzz param should be positive Integer')
        end
      end
    end

    context "when max param is valid" do
      it 'returns fizzbuzz to 3, returning the number or "fizz" if the number is a multiple of 3' do
        expect(Algorithms.fizzbuzz(3)).to eq([1, 2, 'fizz'])
      end

      it 'returns fizzbuzz to 3, returning the number or "fizz" if the number is a multiple of 3' do
        expect(Algorithms.fizzbuzz(3)).to eq([1, 2, 'fizz'])
      end

      it 'returns fizzbuzz to 5, with rules above and multiples of 5 are "buzz"' do
        expect(Algorithms.fizzbuzz(5)).to eq([1, 2, 'fizz', 4, 'buzz'])
      end

      it 'returns fizzbuzz to 15 with rules above and multiples of 3 and 5 are "fizzbuzz"' do
        expect(Algorithms.fizzbuzz(15)).to eq([1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14,
                                              'fizzbuzz'])
      end

      it 'returns fizzbuzz to 30' do
        expect(Algorithms.fizzbuzz(30)).to eq([1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14,
                                              'fizzbuzz', 16, 17, 'fizz', 19, 'buzz', 'fizz', 22, 23, 'fizz', 'buzz', 26,
                                              'fizz', 28, 29, 'fizzbuzz'])
      end
    end
  end

  # describe '.smallest_rectangle_of_aspect' do
  #   it 'finds the smallest rectangle of aspect ratio 1.0 that contains a rectangle of size 300x500' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(1.0, [300, 500])).to eq([500, 500])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 1.0 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(1.0, [500, 300])).to eq([500, 500])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2.0 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2.0, [500, 300])).to eq([500, 1000])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [500, 300])).to eq([600, 300])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.1 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.1, [500, 300])).to eq([3000, 300])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 10 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(10, [500, 300])).to eq([500, 5000])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 10 that contains a rectangle of size 10x10' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(10, [10, 10])).to match_array([10, 100])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 3/5 that contains a rectangle of size 500x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(3.0 / 5.0, [500, 300])).to eq([500, 300])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 200x700' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [200, 700])).to eq([350, 700])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 400x700' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [400, 700])).to eq([1400, 700])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 1.0 that contains a rectangle of size 300x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(1.0, [300, 300])).to eq([300, 300])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 300x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [300, 300])).to eq([300, 600])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 300x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [300, 300])).to eq([600, 300])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 1.0 that contains a rectangle of size 700x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(1.0, [700, 300])).to eq([700, 700])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 700x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [700, 300])).to eq([700, 1400])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 700x600' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [700, 600])).to eq([700, 1400])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 700x300' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [700, 300])).to eq([700, 350])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 700x600' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [700, 600])).to eq([1200, 600])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 1.0 that contains a rectangle of size 300x400' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(1.0, [300, 400])).to eq([400, 400])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 300x400' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [300, 400])).to eq([300, 600])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 300x800' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [300, 800])).to eq([400, 800])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 2 that contains a rectangle of size 400x800' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(2, [400, 800])).to eq([400, 800])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 300x400' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [300, 400])).to eq([800, 400])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 300x800' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [300, 800])).to eq([1600, 800])
  #   end

  #   it 'finds the smallest rectangle of aspect ratio 0.5 that contains a rectangle of size 400x800' do
  #     expect(Algorithms.smallest_rectangle_of_aspect(0.5, [400, 800])).to eq([1600, 800])
  #   end
  # end

  # describe '.parse_time' do
  #   it 'converts 09:00 into number of seconds into the day' do
  #     expect(Algorithms.parse_time('09:00')).to eq(32_400)
  #   end

  #   it 'converts 17:30 into number of seconds into the day' do
  #     expect(Algorithms.parse_time('17:30')).to eq(63_000)
  #   end
  # end
end
