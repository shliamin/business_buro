require 'json'
require 'open-uri'



url = 'https://api.github.com/users/shliamin'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts "#{user["name"]} - #{user["bio"]}"
