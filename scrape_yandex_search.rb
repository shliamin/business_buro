require "open-uri"
require "nokogiri"
require_relative "result"

class ScrapeYandexSearch
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@ingredient}").read
    # 1. Parse HTML
    doc = Nokogiri::HTML(html, nil, "utf-8")
    # 2. For the first five results
    all_results = []
    doc.search(".recette_classique").first(5).each do |element|
      # 3. Create recipe and store it in results
      url = element.search('.m_titre_resultat a').text.strip
      agr = element.search('.m_texte_resultat').text.strip
      sqi = element.search('.m_prep_time').first.parent.text.strip
      all_results << Result.new(url: url, agr: agr, sqi: sqi)
    end
    return all_results
  end
end
