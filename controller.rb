require_relative "view"
require_relative "result"
require_relative "scrape_yandex_search"

class Controller
  def initialize(topurls)
    @topurls = topurls
    @view = View.new
  end

  # USER ACTIONS

  def list_agr
    display_results
  end

  def list_sqi
    display_results
  end

  private

  def display_results
    # 1. Get results (repo)
    results = @topurls.all
    # 2. Display results in the terminal (view)
    @view.display(results)
  end
end
