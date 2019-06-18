require 'json'

filepath = 'data/url_list.json'

serialized_beers = File.read(filepath)
# p serialized_beers

json_file = JSON.parse(serialized_beers)
puts json_file["beers"][1]["name"]
# Array
#       Hash
json_file["beers"].each do |beer|
 p beer["origin"]
end
