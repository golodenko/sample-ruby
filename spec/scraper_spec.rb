# frozen_string_literal: true

require 'scraper'

RSpec.describe 'Scraper' do
  describe '.duckduckwhy' do
    it 'gets the top 5 results for "whytheluckystiff" from duckduckgo.com' do
      results = Scraper.duckduckwhy('whytheluckystiff', 5)
      expect(results).not_to be_nil
      expect(results.size).to eq(5)
      expect(results).to include('https://en.wikipedia.org/wiki/Why_the_lucky_stiff')
    end

    # bad idea to think that order wont change, so this spec makes almost zero sense
    # for me it's num 2 result after whytheluckystiff.net
    # in general scraper like that should test for just for URL format in resulting array]
    # also i would separate specs for getting raw html from duckduckgo and actually parsing it
    # here should be spec for handling error during HTTP request but i'm too tired, sorry :)
    it 'gets the first result for "whytheluckystiff" from duckduckgo.com' do
      results = Scraper.duckduckwhy('whytheluckystiff', 2)
      expect(results).not_to be_nil
      expect(results.size).to eq(2)
      expect(results).to include('https://en.wikipedia.org/wiki/Why_the_lucky_stiff')
    end
  end
end
