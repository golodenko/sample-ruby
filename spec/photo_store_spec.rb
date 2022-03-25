# frozen_string_literal: true

require 'photo_store'

RSpec.describe 'PhotoStore' do
  describe '.finish_time_for_day' do
    let(:opening_hours) do
      {
        'Mon' => ['09:00', '17:30'],
        'Tue' => ['09:00', '17:30'],
        'Wed' => ['09:00', '17:30'],
        'Thu' => ['09:00', '17:30'],
        'Fri' => ['09:00', '17:00']
      }
    end

    it 'returns the closing time for the day from the opening hours' do
      target_day = Time.mktime(2014, 12, 2, 12)
      expected_closing_time = Time.mktime(2014, 12, 2, 17, 30)
      expect(PhotoStore.finish_time_for_day(target_day, opening_hours)).to eq(expected_closing_time)
    end

    it 'returns false if there are no opening times for the given day' do
      target_day = Time.mktime(2014, 12, 6, 12)
      expect(PhotoStore.finish_time_for_day(target_day, opening_hours)).to eq(false)
    end
  end

  describe '.start_time_for_day' do
    let(:opening_hours) do
      {
        'Mon' => ['09:00', '17:30'],
        'Tue' => ['09:00', '17:30'],
        'Wed' => ['09:00', '17:30'],
        'Thu' => ['09:00', '17:30'],
        'Fri' => ['09:00', '17:00']
      }
    end

    it 'returns the opening time for the day from the opening hours' do
      target_day            = Time.mktime(2014, 12, 2, 10)
      expected_opening_time = Time.mktime(2014, 12, 2, 9, 0)
      expect(PhotoStore.start_time_for_day(target_day, opening_hours)).to eq(expected_opening_time)
    end

    it 'returns false if there are no opening times for the given day' do
      target_day = Time.mktime(2014, 12, 6, 10)
      expect(PhotoStore.start_time_for_day(target_day, opening_hours)).to eq(false)
    end
  end

  describe '.calculate_completion_time' do
    let(:opening_hours) do
      {
        'Mon' => ['09:00', '17:30'],
        'Tue' => ['09:00', '17:30'],
        'Wed' => ['09:00', '17:30'],
        'Thu' => ['09:00', '17:30'],
        'Fri' => ['09:00', '17:00']
      }
    end

    it 'calculates when my prints will be ready if they take 2 hours to process and I order them at 11:00 on Tuesday' do
      placed_time                = Time.parse('2014-12-02 11:00 UTC')
      calculated_completion_time = PhotoStore.calculate_completion_time(placed_time, 2, opening_hours)
      expect(calculated_completion_time).to eq(Time.parse('2014-12-02 13:00 UTC'))
    end

    it 'calculates when my prints will be ready if they take 2 hours to process and I order them at 16:30 on Friday' do
      placed_time                = Time.parse('2014-12-05 16:30 UTC')
      calculated_completion_time = PhotoStore.calculate_completion_time(placed_time, 2, opening_hours)
      expect(calculated_completion_time).to eq(Time.parse('2014-12-08 10:30 UTC'))
    end
  end
end
