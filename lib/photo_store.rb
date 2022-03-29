require 'pry'
require 'active_support/all'

Time.zone = 'London'

module PhotoStore
  module_function

  # What i would add (or at leaset check in with PO)
  # - check for different day of the week name e.g. Mon, Mo, Monday
  # - add timezone check: if we parse some stores info we need
  # to store it's timezone and compare with client's
  def finish_time_for_day(date, opening_hours, utc = false)
    return false unless (work_hours = work_hours_for_day(date, opening_hours))

    mix_date_time(date, work_hours[1], utc)
  end

  def start_time_for_day(date, opening_hours, utc = false)
    return false unless (work_hours = work_hours_for_day(date, opening_hours))

    mix_date_time(date, work_hours[0], utc)
  end

  # work_hours gem should be used here, but ok, let's invent some wheels :P
  def calculate_completion_time(placed_at, num_hours, opening_hours)
    first_day = true
    order_time = num_hours * 60
    timestamp = placed_at

    while order_time.positive?
      start_of_day = start_time_for_day(timestamp, opening_hours, true)
      end_of_day = finish_time_for_day(timestamp, opening_hours, true)

      unless start_of_day && end_of_day
        first_day = false
        timestamp += 1.day
        next
      end

      if first_day
        first_day = false
        next if timestamp > end_of_day

        start_of_day = timestamp if timestamp > start_of_day
      end

      productive_time_today = ((end_of_day - start_of_day) / 60)
      order_finish_time = start_of_day + (order_time * 60).seconds if productive_time_today >= order_time
      order_time -= productive_time_today if productive_time_today.positive?
      timestamp += 1.day
    end

    order_finish_time
  end

  def work_hours_for_day(date, opening_hours)
    weekday = date.strftime('%A')[0..2]
    work_hours = opening_hours[weekday]

    return false if work_hours.blank?

    work_hours.map { |time| Time.parse(time) }
  end

  def mix_date_time(date, time, utc = false)
    return Time.utc(date.year, date.month, date.day, time.hour, time.min) if utc

    Time.local(date.year, date.month, date.day, time.hour, time.min)
  end
end
