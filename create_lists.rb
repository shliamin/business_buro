require 'csv'

csv_options = {col_sep: ',', force_quotes: true, quote_char: '"' }
filepath = "data/another_list.csv"

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['URL', 'SQI', 'AGR']
  csv << ['facebook','d','a']
  csv << ['vkontakte','g','j']
  csv << ['twitter','a','s']
  csv << ['instagram','f','h']
  end
