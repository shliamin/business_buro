require "open-uri"
require "nokogiri"
require_relative "result"

class ScrapeAlexaGlobalRank
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{@ingredient}").read
    # 1. Parse HTML
    doc = Nokogiri::HTML(html, nil, "utf-8")
    # 2. For the first five results
    all_results = []
    doc.search(".recipe-card").first(5).each do |element|
      # 3. Create recipe and store it in results
      url = element.search('.recipe-card__title').text.strip
      agr = element.search('.recipe-card__description').text.strip
      sqi = element.search('.recipe-card__duration__value').text.strip
      all_results << Result.new(url: url, agr: agr, sqi: sqi)
    end
    return all_results
  end
end
