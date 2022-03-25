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

    it 'gets the first result for "whytheluckystiff" from duckduckgo.com' do
      results = Scraper.duckduckwhy('whytheluckystiff', 1)
      expect(results).not_to be_nil
      expect(results.size).to eq(1)
      expect(results).to include('https://en.wikipedia.org/wiki/Why_the_lucky_stiff')
    end
  end
end
