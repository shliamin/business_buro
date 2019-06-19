require_relative 'result'
require 'byebug'
require 'httparty'
require 'nokogiri'

class ScrapeYandexSearch

  def call
    url = "https://yandex.ru/search/?lr=177&text=ruby"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    yandex_results = parsed_page.css('div.organic typo typo_text_m typo_line_s')
    all_results = []
    yandex_results.first(10).each do |yandex_result|
      url = yandex_result.css('a')[0].attributes["href"].value
      all_results << Result.new(url: url)
    byebug
    end
    puts all_results
  end
end
