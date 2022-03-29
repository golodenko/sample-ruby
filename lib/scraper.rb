# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'pry'
require 'rexml/document'
include REXML

module Scraper
  module_function

  def duckduckwhy(str, num_results)
    request_result_body = make_request(str)
    request_result_body.scan(/uddg=([^"]*)&amp;rut/).flatten.uniq.first(num_results).map! { |link| CGI.unescape(link) }
  end

  def make_request(str)
    uri = URI("https://html.duckduckgo.com/html/?q=#{str}")
    res = Net::HTTP.get_response(uri)
    return res.body if res.is_a?(Net::HTTPSuccess)
  rescue StandardError => e
    puts "Houston, we have a problem: #{e}"
  end
end
