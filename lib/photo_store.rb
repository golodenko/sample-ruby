require 'pry'
# frozen_string_literal: true

module PhotoStore
  module_function

  # What i would add (or at leaset check in with PO)
    # - check for different day of the week name e.g. Mon, Mo, Monday
    # - add timezone check: if we parse some stores info we need
    # to store it's timezone and compare with client's
  def finish_time_for_day(date, opening_hours)
    return false unless work_hours = work_hours_for_day(date, opening_hours)

    mix_date_time(date, work_hours[1])
  end

  def start_time_for_day(date, opening_hours)
    return false unless work_hours = work_hours_for_day(date, opening_hours)

    mix_date_time(date, work_hours[0])
  end

  # work_hours gem should be used here, but ok, let's invent some wheels :P
  def calculate_completion_time(placed_at, num_hours, opening_hours)

  end

  def work_hours_for_day(date, opening_hours)
    weekday = date.strftime("%A")[0..2]
    work_hours = opening_hours[weekday]

    return false if work_hours.nil? # would use blank if activerecord was allowed :-)

    work_hours.map {|time| Time.parse(time)}
  end

  def mix_date_time(date, time)
    Time.mktime(date.year, date.month, date.day, time.hour, time.min)
  end
end
