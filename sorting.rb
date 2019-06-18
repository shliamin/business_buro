require 'csv'

filepath = 'data/url_list.csv'
#we will use csv_options to make
#data file more readable:
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  #Here row is an array of columns
  # puts "#{row[0]} | #{row[1]} | #{row[2]}"
  #row is a hash here
  puts row["URL"]
end
