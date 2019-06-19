require "csv"
require_relative "result"

class Topurls
  def initialize(csv_file)
    @results = []
    @csv_file = csv_file
    load_csv
  end

  def all
    return @results
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @results << Result.new(row)
    end
  end
end
