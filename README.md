# LiveLink Ruby Test

The idea is to see how you write ruby and how you think about solving problems. The majority of these tests are real problems taken from our existing codebase. Code reuse and additional test coverage where appropriate is encouraged.

Tests are in `spec/`. Run them using `bundle exec rspec` from the top level directory.
Your solutions should go in `lib/`.

## Constraints
- Use only the [core](https://ruby-doc.org/core-2.7.5/) and [standard](https://ruby-doc.org/stdlib-2.7.5/) libraries, no gems (Excluding RSpec which has been included for testing)
- All times should be in UTC
- Code should be compatible with Ruby 2.7.5

## Tasks

We understand that candidates have varying amounts of free time: we have arranged the challenges into three sections to allow for you to submit each as you complete them, should you like to.

- algorithms: a couple of small, independent units of code
- photo store: some common tasks found when working around retail companies
- scraper: a single-purpose utility that involves working with external information

Further information on all of the tasks across these sections can be found below.

### Algorithms.fizzbuzz
Takes an integer as the argument and then returns an array of results up to that number.

### Algorithms.smallest_rectangle_of_aspect
Takes an aspect ratio (height/width) and a rectangle (array [width, height]) and works out the smallest rectangle of that aspect ratio that contains a rectangle of those dimensions.

### Algorithms.parse_time
Takes a string in the form HH:MM and works out how many seconds into the day it is.

### PhotoStore.finish_time_for_day / PhotoStore.start_time_for_day
Takes a date/time object and a hash in the form `{ day => [starts, ends], ... }`, where day is the abbreviated English name, starts and ends are times in the format accepted by Algorithms.parse_time. It returns the start/finish time as a Time object for that day.

### PhotoStore.calculate_completion_time
Takes a time, a number of hours (num_hours) and a hash of opening hours. If I place my order at placed_at time, then this returns the earliest point at which (1) the shop is open and (2) has been open for a total of num_hours since I placed my order. So if I place my order 1 hour before closing time and it takes 2 hours to process, then this will roll over 1 hour into the next working day.

### Scraper.duckduckwhy
Takes a phrase with which to scrape duckduckgo.com to get the first N results, using Net::HTTP.

---

These files are © LiveLink Technology Ltd., 2014-2022 and are for individual applicants and LiveLink only. These files must not be shared to any public domain or third party.
